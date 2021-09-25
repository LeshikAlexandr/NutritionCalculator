package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerRegistrationDto;
import com.example.nutritioncalculator.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class MainController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/")
    public String mainPaige() {
        return "mainPaige";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("customer", new CustomerRegistrationDto());
        return "mainpaige/registration";
    }

    @PostMapping("/registration")
    public String addCustomer(@ModelAttribute("customer") @Valid CustomerRegistrationDto customerRegistrationDto,
                              BindingResult bindingResult,
                              Model model) {
        System.out.println(customerRegistrationDto.getLogin());
        if (bindingResult.hasErrors()) {
            return "mainpaige/registration";
        }
        if (!customerService.saveCustomer(customerRegistrationDto)) {
            model.addAttribute("customerError", "Пользователь с таким именем уже существует");
            return "mainpaige/registration";
        }
        return "redirect:/";
    }

    @GetMapping("/catalog")
    public String catalog() {
        return "mainpaige/catalog";
    }
}
