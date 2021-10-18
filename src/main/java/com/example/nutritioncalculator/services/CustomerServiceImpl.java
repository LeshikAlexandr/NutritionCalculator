package com.example.nutritioncalculator.services;


import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.controllers.dto.CustomerRegistrationDto;
import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.models.Activity;
import com.example.nutritioncalculator.models.Customer;
import com.example.nutritioncalculator.models.Sex;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import com.example.nutritioncalculator.repositories.RoleRepository;
import com.example.nutritioncalculator.utils.CustomerConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import static com.example.nutritioncalculator.utils.CoefficientConstant.*;
import static com.example.nutritioncalculator.utils.CustomerConverter.convertCustomerEntityToCustomerDto;
import static com.example.nutritioncalculator.utils.CustomerConverter.convertCustomerRegistrationDtoToCustomerEntity;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RoleRepository roleRepository;
//    private final DailyMenuService dailyMenuService;
//    private final DailyMenuRepository dailyMenuRepository;

    @Override
    public List<CustomerDto> getAllCustomer() {
        return customerRepository.findAll()
                .stream()
                .map(CustomerConverter::convertCustomerEntityToCustomerDto)
                .collect(Collectors.toList());
    }

    @Override
    public CustomerDto getCustomer(String login) {
        CustomerDto customerDto = convertCustomerEntityToCustomerDto(customerRepository.findCustomerByLogin(login)
                .orElseThrow(() -> new Exception("Не удалось найти пользователя")));
        return setCaloriesForCustomerDto(customerDto);
    }

    @Override
    public CustomerDto getCustomer(int id) {
        CustomerDto customerDto = convertCustomerEntityToCustomerDto(customerRepository.findById(id)
                .orElseThrow(() -> new Exception("Не удалось найти пользователя")));
        return setCaloriesForCustomerDto(customerDto);
    }

    @Override
    public void addFollower(String login, Integer followerId) {
        Customer customer = customerRepository.findCustomerByLogin(login).orElseThrow(() -> new Exception("Не удалось найти пользователя"));
        Customer follower = customerRepository.getById(followerId);
        customer.addFollower(follower);
        customerRepository.save(customer);
    }
//
//    @Override
//    public Set<Customer> getAllFollowers(String login) {
//        Customer customer = customerRepository.findCustomerByLogin(login).orElseThrow(() -> new Exception("Не удалось найти пользователя"));
//        return customer.getFollowers();
//    }

    @Override
    public boolean saveCustomer(CustomerRegistrationDto customerRegistrationDto) {

        Customer customer = convertCustomerRegistrationDtoToCustomerEntity(customerRegistrationDto);
        Customer customerFromBd = customerRepository.findCustomerByLogin(customer.getLogin()).orElse(null);

        if (customerFromBd != null) {
            return false;
        }

        customer.setRoles(Collections.singleton(roleRepository.findByName("user")));
        customer.setPassword(passwordEncoder.encode(customer.getPassword()));
        customerRepository.save(customer);
//        dailyMenuService.saveDailyMenu(customer);
        //customer.setDailyMenu(dailyMenuRepository.getOne());
        return true;
    }

    @Override
    @Transactional
    public void updateCustomer(int id, CustomerDto customerDto) {

        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new Exception("Невозможно обновить пользователя. Пользователь не найден"));
        if (customerDto.getSex() != null) {
            customer.setSex(customerDto.getSex());
        }
        if (customerDto.getAge() != 0) {
            customer.setAge(customerDto.getAge());
        }
        if (customerDto.getWeight() != 0) {
            customer.setWeight(customerDto.getWeight());
        }
        if (customerDto.getHeight() != 0) {
            customer.setHeight(customerDto.getHeight());
        }
        if (customerDto.getActivity() != null) {
            customer.setActivity(customerDto.getActivity());
        }
    }

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        return customerRepository.findCustomerByLogin(login)
                .orElseThrow(() -> new Exception("Не удалось найти пользователя"));
    }

    private double getBasicMetabolism(CustomerDto customerDto) {

        if (customerDto.getSex() == null) {
            return 0;
        }

        if (Sex.FEMALE == customerDto.getSex()) {
            return Math.floor(WEIGHT_COEFFICIENT * customerDto.getWeight()
                    + HEIGHT_COEFFICIENT * customerDto.getHeight()
                    - AGE_COEFFICIENT * customerDto.getAge()
                    - WOMEN_COEFFICIENT);
        } else {
            return Math.floor(WEIGHT_COEFFICIENT * customerDto.getWeight()
                    + HEIGHT_COEFFICIENT * customerDto.getHeight()
                    - AGE_COEFFICIENT * customerDto.getAge()
                    - MEN_COEFFICIENT);
        }
    }

    private CustomerDto setCaloriesForCustomerDto(CustomerDto customerDto) {
        customerDto.setBasicMetabolism(getBasicMetabolism(customerDto));
        customerDto.setWeightLossCalories(getWeightLossCalories(customerDto));
        customerDto.setWeightGainCalories(getWeightGainCalories(customerDto));
        customerDto.setWeightMaintainCalories(getWeightMaintainCalories(customerDto));
        return customerDto;
    }

    private double getWeightLossCalories(CustomerDto customerDto) {
        return Math.floor(getWeightMaintainCalories(customerDto) * WEIGHT_LOSS_COEFFICIENT);
    }

    private double getWeightGainCalories(CustomerDto customerDto) {
        return Math.floor(getWeightMaintainCalories(customerDto) * WEIGHT_GAIN_COEFFICIENT);
    }

    private double getWeightMaintainCalories(CustomerDto customerDto) {

        if (customerDto.getActivity() == null) {
            return 0;
        }

        if (Activity.LOW == customerDto.getActivity()) {
            return Math.floor(getBasicMetabolism(customerDto) * LOW_ACTIVITY_COEFFICIENT);
        } else if (Activity.MEDIUM == customerDto.getActivity()) {
            return Math.floor(getBasicMetabolism(customerDto) * MEDIUM_ACTIVITY_COEFFICIENT);
        } else {
            return Math.floor(getBasicMetabolism(customerDto) * HIGH_ACTIVITY_COEFFICIENT);
        }
    }
}
