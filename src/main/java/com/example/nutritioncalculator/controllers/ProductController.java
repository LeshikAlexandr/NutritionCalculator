package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.ProductDto;
import com.example.nutritioncalculator.services.DailyMenuService;
import com.example.nutritioncalculator.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private DailyMenuService dailyMenuService;

    @GetMapping
    public String getAllProducts(Model model) {
        model.addAttribute("products", productService.getAllProduct());
        return "products/getProducts";
    }

    @GetMapping("/new")
    public String newProduct(Model model) {
        model.addAttribute("product", new ProductDto());
        return "products/new";
    }

    @GetMapping("/search")
    public String getProduct(@RequestParam(value = "name") String name,
                             @RequestParam(value = "eating") String eating,
                             Model model,
                             Principal principal) {
        model.addAttribute("product", productService.getProduct(name));
        model.addAttribute("dailyMenu", dailyMenuService.getDailyMenuDto(principal.getName()));
        model.addAttribute("eating", eating);
        System.out.println(eating);
        return "dailymenu/addProductToDailyMenu";
    }

    @PostMapping("/new")
    public String create(@ModelAttribute("product") @Valid ProductDto productDto,
                         BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "products/new";
        }
        productService.saveProduct(productDto);
        return "redirect:/products";
    }

    @GetMapping("/update/{id}")
    public String edit(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("product", productService.getProduct((id)));
        return "products/update";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute("product") @Valid ProductDto productDto,
                         BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "products/update";
        }
        productService.updateProduct(productDto);
        return "redirect:/products";
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        productService.deleteProduct(id);
        return "redirect:/products";
    }
}
