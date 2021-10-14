package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.services.DailyMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;


@Controller
public class DailyMenuController {

    @Autowired
    private DailyMenuService dailyMenuService;

    @GetMapping("/daily-menus")
    public String getDailyMenuById(Model model, Principal principal) {
        model.addAttribute("dailyMenu", dailyMenuService.getDailyMenuDto(principal.getName()));
        return "dailymenu/getDailyMenu";
    }

    @GetMapping("/add")
    public String getDailyMenuById(@RequestParam("eating") String eating, Model model) {

        model.addAttribute("eating", eating);
        return "dailymenu/addProductToDailyMenu";
    }

    @PostMapping("/daily-menus/{dailyMenuId}/products")
    public String addDailyMenu(@ModelAttribute("product") ProductDto product, @PathVariable("dailyMenuId") Integer dailyMenuId) {
        dailyMenuService.addProductToDailyMenu(dailyMenuId, product, Eating.valueOf(product.getEating()));
        return "redirect:/daily-menus";
    }
}
