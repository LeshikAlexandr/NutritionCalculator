package com.example.nutritioncalculator.services.interfaces;


import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.models.Product;
import com.example.nutritioncalculator.models.ProductDailyMenu;

import java.util.List;

public interface ProductDailyMenuService {

    List<ProductDailyMenu> getProductDailyMenus(int dailyId);

    void save(ProductDailyMenu productDailyMenu);

    ProductDailyMenu getProductDailyMenus(int dailyId, Eating eating, int productId);

    void removeAllByProduct(Product product);

    void removeAllByProductAndEatingAndDailyMenuId(int productId, Eating eating, int dailyMenuId);

    List<ProductDailyMenu> getByDailyMenuIdAndEating(int dailyMenuId, Eating eating);
}
