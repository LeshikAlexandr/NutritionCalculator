package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.DailyMenuDto;
import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.models.Eating;
import com.example.nutritioncalculator.services.interfaces.DailyMenuService;
import com.example.nutritioncalculator.services.interfaces.ProductDailyMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class DailyMenuController {

    @Autowired
    private DailyMenuService dailyMenuService;

    @Autowired
    private ProductDailyMenuService productDailyMenuService;

    @GetMapping("/daily-menus")
    public String getDailyMenuById(Model model, Principal principal) {
        DailyMenuDto dailyMenuDto = dailyMenuService.getDailyMenuDto(principal.getName());
        model.addAttribute("productDailyMenuBreakfast", productDailyMenuService.getByDailyMenuIdAndEating(dailyMenuDto.getId(), Eating.BREAKFAST));
        model.addAttribute("productDailyMenuDinner", productDailyMenuService.getByDailyMenuIdAndEating(dailyMenuDto.getId(), Eating.DINNER));
        model.addAttribute("productDailyMenuSupper", productDailyMenuService.getByDailyMenuIdAndEating(dailyMenuDto.getId(), Eating.SUPPER));
        model.addAttribute("dailyMenu", dailyMenuDto);
        return "dailymenu/getDailyMenu";
    }

    @GetMapping("/add")
    public String getDailyMenuById(@RequestParam("eating") String eating, Model model) {

        model.addAttribute("eating", eating);
        return "dailymenu/addProductToDailyMenu";
    }

    @PostMapping("/daily-menus/{dailyMenuId}/products")
    public String addDailyMenu(@ModelAttribute("product") @Valid ProductDto product,
                               BindingResult bindingResult,
                               @PathVariable("dailyMenuId") Integer dailyMenuId) {

        if (bindingResult.hasErrors()) {
            return "dailymenu/addProductToDailyMenu";
        }

        dailyMenuService.addProductToDailyMenu(dailyMenuId, product, Eating.valueOf(product.getEating()));
        return "redirect:/daily-menus";
    }

    @PostMapping("/delete/{dailyMenuId}/{productId}")
    public String deleteProductFromDailyMenu(@RequestParam("eating") String eating,
                                             @PathVariable("dailyMenuId") Integer dailyMenuId,
                                             @PathVariable("productId") Integer productId) {
        productDailyMenuService.removeAllByProductAndEatingAndDailyMenuId(productId, Eating.valueOf(eating), dailyMenuId);
        return "redirect:/daily-menus";
    }

}
