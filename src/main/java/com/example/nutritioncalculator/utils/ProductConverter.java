package com.example.nutritioncalculator.utils;


import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.models.Product;
import lombok.experimental.UtilityClass;

@UtilityClass
public class ProductConverter {

    public static ProductDto convertProductEntityToDto(Product product) {

        return ProductDto.builder()
                .id(product.getId())
                .name(product.getName())
                .nominalCalories(product.getCalories())
                .carbohydrates(product.getCarbohydrates())
                .fat(product.getFat())
                .protein(product.getProtein())
                .build();
    }

    public static Product convertProductDtoToEntity(ProductDto productDto) {

        return Product.builder()
                .id(productDto.getId())
                .name(productDto.getName())
                .calories(productDto.getNominalCalories())
                .carbohydrates(productDto.getCarbohydrates())
                .fat(productDto.getFat())
                .protein(productDto.getProtein())
                .build();
    }
}
