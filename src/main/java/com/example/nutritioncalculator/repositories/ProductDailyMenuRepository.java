package com.example.nutritioncalculator.repositories;


import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.models.Product;
import com.example.nutritioncalculator.models.ProductDailyMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductDailyMenuRepository extends JpaRepository<ProductDailyMenu, Integer> {

    List<ProductDailyMenu> findAllProductDailyMenuByDailyMenuId(int daily);

    Optional<ProductDailyMenu> findByDailyMenuIdAndEatingAndProductId(int daily, Eating eating, int productId);

    void removeAllByProduct(Product product);

    void removeAllByProductAndEatingAndDailyMenuId(Product product, Eating eating, int dailyMenuId);
}
