package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.services.interfaces.CustomerService;
import com.example.nutritioncalculator.services.interfaces.DailyMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/food-diaries")
public class FoodDiaryController {

    @Autowired
    private DailyMenuService dailyMenuService;

    @Autowired
    private CustomerService customerService;

    @GetMapping
    public String getAllDailyMenus(Model model, Principal principal) {
        String login = principal.getName();
        CustomerDto customer = customerService.getCustomer(login);
        model.addAttribute("foodDiary", dailyMenuService.getAllDailyMenus(customer.getId()));
        return "fooddiary/foodDiary";
    }
}
