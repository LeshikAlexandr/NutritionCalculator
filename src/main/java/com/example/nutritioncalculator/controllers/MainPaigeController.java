package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.services.interfaces.CustomerService;
import com.example.nutritioncalculator.services.interfaces.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainPaigeController {

    @Autowired
    private PostService postService;

    @Autowired
    private CustomerService customerService;

    @GetMapping("/")
    public String profile(Model model) {
        model.addAttribute("posts", postService.getAllCustomerPosts("admin"));
        return "posts/portalNews";
    }
}
