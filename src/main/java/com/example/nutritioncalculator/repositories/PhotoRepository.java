package com.example.nutritioncalculator.repositories;

import com.example.nutritioncalculator.models.Photo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PhotoRepository extends JpaRepository<Photo, Integer> {

    Optional<Photo> findByName(String name);

    Optional<Photo> findByCustomerId(int customerId);

    Optional<Photo> findByCustomerLogin(String login);
}
