package com.example.nutritioncalculator.services;


import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.models.ProductDailyMenu;

import java.util.List;

public interface ProductDailyMenuService {

    List<ProductDailyMenu> getProductDailyMenus(int dailyId);

    void save(ProductDailyMenu productDailyMenu);

    ProductDailyMenu getProductDailyMenus(int dailyId, Eating eating, int productId);
}
