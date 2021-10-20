package com.example.nutritioncalculator.services.interfaces;

import com.example.nutritioncalculator.controllers.dto.ProductDto;

import java.util.List;

public interface ProductService {

    List<ProductDto> getAllProduct();

    ProductDto getProduct(int id);

    ProductDto getProduct(String name);

    List<ProductDto> getProducts(String name);

    void saveProduct(ProductDto productDto);

    void deleteProduct(int id);

    void updateProduct(ProductDto productDto);
}
