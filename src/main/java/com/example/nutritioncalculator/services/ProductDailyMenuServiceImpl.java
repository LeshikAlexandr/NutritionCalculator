package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.models.Product;
import com.example.nutritioncalculator.models.ProductDailyMenu;
import com.example.nutritioncalculator.repositories.ProductDailyMenuRepository;
import com.example.nutritioncalculator.repositories.ProductRepository;
import com.example.nutritioncalculator.services.interfaces.ProductDailyMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductDailyMenuServiceImpl implements ProductDailyMenuService {

    @Autowired
    private ProductDailyMenuRepository productDailyMenuRepository;

    @Autowired
    private ProductRepository productRepository;


    @Override
    public List<ProductDailyMenu> getProductDailyMenus(int dailyId) {
        return productDailyMenuRepository.findAllProductDailyMenuByDailyMenuId(dailyId);
    }

    @Override
    public void save(ProductDailyMenu productDailyMenu) {
        productDailyMenuRepository.save(productDailyMenu);
    }

    @Override
    public ProductDailyMenu getProductDailyMenus(int dailyId, Eating eating, int productId) {
        return productDailyMenuRepository.findByDailyMenuIdAndEatingAndProductId(dailyId, eating, productId)
                .orElse(ProductDailyMenu.builder()
                        .dailyMenuId(dailyId)
                        .eating(eating)
                        .product(productRepository.findById(productId).orElse(null))
                        .build());
    }

    @Override
    public void removeAllByProduct(Product product) {
        productDailyMenuRepository.removeAllByProduct(product);
    }

    @Override
    @Transactional
    public void removeAllByProductAndEatingAndDailyMenuId(int productId, Eating eating, int dailyMenuId) {
        Product product = productRepository.findById(productId).orElseThrow(() -> new Exception("Не удалось найти продукт"));
        productDailyMenuRepository.removeAllByProductAndEatingAndDailyMenuId(product, eating, dailyMenuId);
    }
}
