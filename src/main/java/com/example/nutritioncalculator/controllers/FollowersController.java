package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.models.Customer;
import com.example.nutritioncalculator.models.Post;
import com.example.nutritioncalculator.services.CustomerService;
import com.example.nutritioncalculator.services.PostService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/followers")
public class FollowersController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private PostService postService;

    @GetMapping
    public String getAllCustomers(Principal principal, Model model) {
        String login = principal.getName();
        CustomerDto customerDto = customerService.getCustomer(login);
        model.addAttribute("customer", customerDto);
        model.addAttribute("customers", customerService.getAllCustomer());
        return "followers/allCustomers";
    }

    @PostMapping("/add_follower/{id}")
    public String addFollower(@PathVariable("id") int id, Principal principal) {
        String login = principal.getName();
        customerService.addFollower(login, id);
        return "redirect:/followers";
    }

    @GetMapping("/posts/{login}")
    public String getFollowersPosts(@PathVariable("login") String login, Principal principal, Model model) {
        model.addAttribute("allFollowersPosts", postService.getAllFollowersPosts(login));
        return "followers/posts";
    }
}
