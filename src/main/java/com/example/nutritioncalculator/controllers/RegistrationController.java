package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerRegistrationDto;
import com.example.nutritioncalculator.services.interfaces.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

    @Autowired
    private CustomerService customerService;

    @GetMapping
    public String registration(Model model) {
        model.addAttribute("customer", new CustomerRegistrationDto());
        return "security/registration";
    }

    @PostMapping
    public String addUser(@ModelAttribute("customer") @Valid CustomerRegistrationDto customerRegistrationDto,
                          BindingResult bindingResult, Model model) {
        System.out.println(customerRegistrationDto.getLogin());
        if (bindingResult.hasErrors()) {
            return "security/registration";
        }
        if (!customerService.saveCustomer(customerRegistrationDto)) {
            model.addAttribute("customerError", "Пользователь с таким именем уже существует");
            return "security/registration";
        }
        return "redirect:/profile";
    }
}
