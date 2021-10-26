package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.controllers.dto.DailyMenuDto;
import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.services.interfaces.CustomerService;
import com.example.nutritioncalculator.services.interfaces.DailyMenuService;
import com.example.nutritioncalculator.services.interfaces.ProductDailyMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequestMapping("/food-diaries")
public class FoodDiaryController {

    @Autowired
    private DailyMenuService dailyMenuService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ProductDailyMenuService productDailyMenuService;

    @GetMapping
    public String getAllDailyMenus(Model model, Principal principal) {
        String login = principal.getName();
        CustomerDto customer = customerService.getCustomer(login);
        model.addAttribute("foodDiary", dailyMenuService.getAllDailyMenus(customer.getId()));
        return "fooddiary/foodDiary";
    }

    @GetMapping("/show")
    public String getDailyMenu(@RequestParam("id") String id, Model model) {
        DailyMenuDto dailyMenuDto = dailyMenuService.getDailyMenuDtoById(Integer.parseInt(id));
        model.addAttribute("productDailyMenuBreakfast", productDailyMenuService.getByDailyMenuIdAndEating(dailyMenuDto.getId(), Eating.BREAKFAST));
        model.addAttribute("productDailyMenuDinner", productDailyMenuService.getByDailyMenuIdAndEating(dailyMenuDto.getId(), Eating.DINNER));
        model.addAttribute("productDailyMenuSupper", productDailyMenuService.getByDailyMenuIdAndEating(dailyMenuDto.getId(), Eating.SUPPER));
        model.addAttribute("dailyMenu", dailyMenuDto);
        return "fooddiary/dailyMenu";
    }
}
