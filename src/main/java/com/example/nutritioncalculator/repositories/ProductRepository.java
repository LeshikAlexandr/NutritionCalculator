package com.example.nutritioncalculator.repositories;

import com.example.nutritioncalculator.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findByNameContainingIgnoreCase(String productName);

    void deleteById(int id);

    Optional<Product> findById(int id);
}
