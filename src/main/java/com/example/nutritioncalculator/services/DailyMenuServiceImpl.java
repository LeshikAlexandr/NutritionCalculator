package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.DailyMenuDto;
import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.models.Customer;
import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.models.Product;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.function.Function;

@Service
public class DailyMenuServiceImpl implements DailyMenuService {
    @Override
    public DailyMenuDto getDailyMenuDto(String login) {
        return null;
    }

    @Override
    public List<ProductDto> getEatingProducts(List<Product> products, int dailyMenuId, Eating eating) {
        return null;
    }

    @Override
    public int getGeneralNutrients(List<ProductDto> products, Function<ProductDto, Integer> getter) {
        return 0;
    }

    @Override
    public void saveDailyMenuForEveryCustomer() {

    }

    @Override
    public void saveDailyMenu(Customer customer) {

    }

    @Override
    public void addProductToDailyMenu(int dailyMenuId, ProductDto productDto, Eating eating) {

    }

    @Override
    public List<DailyMenuDto> getAllDailyMenus(int customerId) {
        return null;
    }
}
