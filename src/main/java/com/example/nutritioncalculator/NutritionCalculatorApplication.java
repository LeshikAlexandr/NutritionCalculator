package com.example.nutritioncalculator;

import com.example.nutritioncalculator.models.Customer;
import com.example.nutritioncalculator.models.Role;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashSet;
import java.util.Set;

@SpringBootApplication
public class NutritionCalculatorApplication implements CommandLineRunner {

    @Autowired
    private CustomerRepository customerRepository;

    public static void main(String[] args) {
        SpringApplication.run(NutritionCalculatorApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
//        Customer customer = new Customer();
//        customer.setLogin("u");
//        customer.setPassword("$2a$10$u3Wz.q.atVFmrdBWQYfu..oOvXywn7o2QHEsgFMy0em/wU1XJZA5i");
//
//        Role role = new Role();
//        role.setName("USER");
//
//        Set<Role> roles = new HashSet<>();
//        roles.add(role);
//
//        customer.setRoles(roles);
//
//        customerRepository.saveAndFlush(customer);

    }
}
