package com.example.nutritioncalculator.services;


import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.controllers.dto.CustomerRegistrationDto;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface CustomerService extends UserDetailsService {

    List<CustomerDto> getAllCustomer();

    boolean saveCustomer(CustomerRegistrationDto customerRegistrationDto);

    void updateCustomer(int id, CustomerDto customerDto);

    CustomerDto getCustomer(String login);

    CustomerDto getCustomer(int id);

}
