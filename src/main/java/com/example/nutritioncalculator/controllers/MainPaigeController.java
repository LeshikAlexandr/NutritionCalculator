package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.services.interfaces.PostService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainPaigeController {

    private static final Logger logger = LogManager.getLogger(MainPaigeController.class);

    @Autowired
    private PostService postService;

    @GetMapping("/")
    public String profile(Model model) {

        model.addAttribute("posts", postService.getAllCustomerPosts("admin"));
        logger.info("Application started");

        return "posts/portalNews";
    }
}
