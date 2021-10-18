package com.example.nutritioncalculator.services;


import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.controllers.dto.CustomerRegistrationDto;
import com.example.nutritioncalculator.models.Customer;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Set;

public interface CustomerService extends UserDetailsService {

    List<CustomerDto> getAllCustomer();

    boolean saveCustomer(CustomerRegistrationDto customerRegistrationDto);

    void updateCustomer(int id, CustomerDto customerDto);

    CustomerDto getCustomer(String login);

    CustomerDto getCustomer(int id);

    void addFollower(String login, Integer followerId);

//    Set<Customer> getAllFollowers(String login);

}
