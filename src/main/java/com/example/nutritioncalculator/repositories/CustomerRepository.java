package com.example.nutritioncalculator.repositories;

import com.example.nutritioncalculator.models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

    Optional<Customer> findById(int id);

    Optional<Customer> findCustomerByLogin(String login);
}
