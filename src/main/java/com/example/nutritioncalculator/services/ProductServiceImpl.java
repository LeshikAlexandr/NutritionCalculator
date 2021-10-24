package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.repositories.ProductRepository;
import com.example.nutritioncalculator.services.interfaces.ProductDailyMenuService;
import com.example.nutritioncalculator.services.interfaces.ProductService;
import com.example.nutritioncalculator.utils.ProductConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static com.example.nutritioncalculator.utils.ProductConverter.convertProductDtoToEntity;
import static com.example.nutritioncalculator.utils.ProductConverter.convertProductEntityToDto;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductDailyMenuService productDailyMenuService;

    @Override
    public List<ProductDto> getAllProduct() {
        return productRepository.findAll()
                .stream()
                .map(ProductConverter::convertProductEntityToDto)
                .sorted(Comparator.comparing(ProductDto::getName))
                .collect(Collectors.toList());
    }

    @Override
    public ProductDto getProduct(int id) {
        return convertProductEntityToDto(productRepository.findById(id)
                .orElseThrow(() -> new Exception("Не удалось найти продукт")));
    }

    @Override
    public List<ProductDto> getProducts(String name) {
        return productRepository.findByNameContainingIgnoreCase(name)
                .stream()
                .map(ProductConverter::convertProductEntityToDto)
                .collect(Collectors.toList());
    }

    @Override
    public ProductDto getProduct(String name) {
        return ProductConverter.convertProductEntityToDto(productRepository.findByName(name));
    }

    @Override
    public void saveProduct(ProductDto productDto) {

        if (productRepository.findByName(productDto.getName()) == null) {
            productRepository.save(convertProductDtoToEntity(productDto));
        } else {
            throw new Exception("Такой продукт уже существует");
        }
    }

    @Override
    @Transactional
    public void deleteProduct(int id) {
        productDailyMenuService.removeAllByProduct(productRepository.findById(id).orElseThrow(() -> new Exception("Не удалось найти продукт")));
        productRepository.deleteById(id);
    }

    @Override
    public void updateProduct(ProductDto productDto) {
        productRepository.save(convertProductDtoToEntity(productDto));
    }

}
