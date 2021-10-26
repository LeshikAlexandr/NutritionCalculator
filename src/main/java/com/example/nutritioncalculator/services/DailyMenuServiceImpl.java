package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.DailyMenuDto;
import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.models.*;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import com.example.nutritioncalculator.repositories.DailyMenuRepository;
import com.example.nutritioncalculator.services.interfaces.DailyMenuService;
import com.example.nutritioncalculator.services.interfaces.ProductDailyMenuService;
import com.example.nutritioncalculator.utils.DailyMenuConverter;
import com.example.nutritioncalculator.utils.ProductConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.mapping;

@Service
public class DailyMenuServiceImpl implements DailyMenuService {

    @Autowired
    private DailyMenuRepository dailyMenuRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private ProductDailyMenuService productDailyMenuService;


    @Override
    public DailyMenuDto getDailyMenuDto(String login) {

        DailyMenu dailyMenu = dailyMenuRepository.findByCustomerLoginAndCreatedDate(login, LocalDate.now())
                .orElseThrow(() -> new Exception("Не удалось найти Дневное меню"));

        return addProductsToDailyMenuDto(dailyMenu);
    }

    @Override
    public void saveDailyMenuForEveryCustomer() {

        customerRepository.findAll()
                .forEach(this::saveDailyMenu);
    }

    @Override
    public void saveDailyMenu(Customer customer) {

        DailyMenu dailyMenu = new DailyMenu();
        dailyMenu.setCreatedDate(LocalDate.now());
        dailyMenu.setCustomer(customer);
        dailyMenuRepository.save(dailyMenu);
    }

    @Override
    public void addProductToDailyMenu(int dailyMenuId, ProductDto productDto, Eating eating) {

        ProductDailyMenu productDailyMenuFromDb = productDailyMenuService.getProductDailyMenus(dailyMenuId, eating, productDto.getId());

        int weight = productDailyMenuFromDb.getProductWeight() + productDto.getWeight();
        productDailyMenuFromDb.setProductWeight(weight);
        productDailyMenuService.save(productDailyMenuFromDb);

        DailyMenu dailyMenu = dailyMenuRepository.findById(dailyMenuId)
                .orElseThrow(() -> new Exception("Не удалось найти Дневное меню id: " + dailyMenuId));

        setGeneralInformation(dailyMenu);
    }

    @Override
    public List<DailyMenuDto> getAllDailyMenus(int customerId) {

        return dailyMenuRepository.findAllByCustomerId(customerId)
                .stream()
                .map(DailyMenuConverter::convertDailyMenuEntityToDailyMenuDto)
                .collect(Collectors.toList());
    }

    private Map<Eating, List<Product>> getProductsByEating(DailyMenu dailyMenu) {

        List<ProductDailyMenu> productDailyMenus = productDailyMenuService.getProductDailyMenus(dailyMenu.getId());

        return productDailyMenus.stream()
                .collect(groupingBy(ProductDailyMenu::getEating,
                        mapping(ProductDailyMenu::getProduct, Collectors.toList())));
    }

    private ProductDto setFactualNutrientsForProductDto(int dailyMenuId, Eating eating, ProductDto productDto) {
        ProductDailyMenu productDailyMenu = productDailyMenuService.getProductDailyMenus(dailyMenuId, eating, productDto.getId());
        productDto.setFactualCalories(productDto.getNominalCalories() * productDailyMenu.getProductWeight() / 100);
        productDto.setFactualCarbohydrates(productDto.getCarbohydrates() * productDailyMenu.getProductWeight() / 100);
        productDto.setFactualProtein(productDto.getProtein() * productDailyMenu.getProductWeight() / 100);
        productDto.setFactualFat(productDto.getFat() * productDailyMenu.getProductWeight() / 100);
        return productDto;
    }

    private List<ProductDto> getDailyMenuProducts(Map<Eating, List<Product>> productsByEating) {
        return productsByEating.values()
                .stream()
                .flatMap(List::stream)
                .map(ProductConverter::convertProductEntityToDto)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void saveNew(int dailyMenuId) {

        DailyMenu dailyMenu = dailyMenuRepository.findById(dailyMenuId)
                .orElseThrow(() -> new Exception("Не удалось найти Дневное меню id:" + dailyMenuId));

        setGeneralInformation(dailyMenu);
    }

    @Override
    public List<DailyMenu> getAll() {
        return dailyMenuRepository.findAll();
    }

    @Override
    public List<ProductDto> getEatingProducts(List<Product> products, int dailyMenuId, Eating eating) {

        return Stream.ofNullable(products)
                .flatMap(List::stream)
                .map(ProductConverter::convertProductEntityToDto)
                .map(productDto -> setFactualNutrientsForProductDto(dailyMenuId, eating, productDto))
                .collect(Collectors.toList());
    }

    @Override
    public int getGeneralNutrients(List<ProductDto> products, Function<ProductDto, Integer> getter) {

        return products.stream()
                .map(getter::apply)
                .flatMapToInt(IntStream::of)
                .sum();
    }

    @Override
    public DailyMenuDto getDailyMenuDtoById(int dailyMenuId) {
        DailyMenu dailyMenu = dailyMenuRepository.findById(dailyMenuId)
                .orElseThrow(() -> new Exception("Не удалось найти Дневное меню"));

        return addProductsToDailyMenuDto(dailyMenu);
    }

    private DailyMenuDto addProductsToDailyMenuDto(DailyMenu dailyMenu) {
        Map<Eating, List<Product>> productByEating = getProductsByEating(dailyMenu);

        List<ProductDto> breakfastsProducts = getEatingProducts(productByEating.get(Eating.BREAKFAST), dailyMenu.getId(), Eating.BREAKFAST);
        List<ProductDto> dinnerProducts = getEatingProducts(productByEating.get(Eating.DINNER), dailyMenu.getId(), Eating.DINNER);
        List<ProductDto> supperProducts = getEatingProducts(productByEating.get(Eating.SUPPER), dailyMenu.getId(), Eating.SUPPER);

        DailyMenuDto dailyMenuDto = DailyMenuConverter.convertDailyMenuEntityToDailyMenuDto(dailyMenu);
        dailyMenuDto.setBreakfast(breakfastsProducts);
        dailyMenuDto.setDinner(dinnerProducts);
        dailyMenuDto.setSupper(supperProducts);

        return dailyMenuDto;
    }

    private void setGeneralInformation(DailyMenu dailyMenu) {
        Map<Eating, List<Product>> productByEating = getProductsByEating(dailyMenu);

        List<ProductDto> breakfastsProducts = getEatingProducts(productByEating.get(Eating.BREAKFAST), dailyMenu.getId(), Eating.BREAKFAST);
        List<ProductDto> dinnerProducts = getEatingProducts(productByEating.get(Eating.DINNER), dailyMenu.getId(), Eating.DINNER);
        List<ProductDto> supperProducts = getEatingProducts(productByEating.get(Eating.SUPPER), dailyMenu.getId(), Eating.SUPPER);

        dailyMenu.setGeneralCalories(getGeneralNutrients(breakfastsProducts, ProductDto::getFactualCalories)
                + getGeneralNutrients(dinnerProducts, ProductDto::getFactualCalories)
                + getGeneralNutrients(supperProducts, ProductDto::getFactualCalories));
        dailyMenu.setGeneralProteins(getGeneralNutrients(breakfastsProducts, ProductDto::getFactualProtein)
                + getGeneralNutrients(dinnerProducts, ProductDto::getFactualProtein)
                + getGeneralNutrients(supperProducts, ProductDto::getFactualProtein));
        dailyMenu.setGeneralFats(getGeneralNutrients(breakfastsProducts, ProductDto::getFactualFat)
                + getGeneralNutrients(dinnerProducts, ProductDto::getFactualFat)
                + getGeneralNutrients(supperProducts, ProductDto::getFactualFat));
        dailyMenu.setGeneralCarbohydrates(getGeneralNutrients(breakfastsProducts, ProductDto::getFactualCarbohydrates)
                + getGeneralNutrients(dinnerProducts, ProductDto::getFactualCarbohydrates)
                + getGeneralNutrients(supperProducts, ProductDto::getFactualCarbohydrates));
        dailyMenuRepository.save(dailyMenu);

    }
}
