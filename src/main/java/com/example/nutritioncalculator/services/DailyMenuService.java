package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.DailyMenuDto;
import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.models.Customer;
import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.models.Product;

import java.util.List;
import java.util.function.Function;

public interface DailyMenuService {

    DailyMenuDto getDailyMenuDto(String login);

    List<ProductDto> getEatingProducts(List<Product> products, int dailyMenuId, Eating eating);

    int getGeneralNutrients(List<ProductDto> products, Function<ProductDto, Integer> getter);

    void saveDailyMenuForEveryCustomer();

    void saveDailyMenu(Customer customer);

    void addProductToDailyMenu(int dailyMenuId, ProductDto productDto, Eating eating);

    List<DailyMenuDto> getAllDailyMenus(int customerId);
}
