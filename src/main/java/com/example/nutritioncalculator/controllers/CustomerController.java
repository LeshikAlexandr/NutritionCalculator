package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.services.interfaces.CustomerService;
import com.example.nutritioncalculator.services.interfaces.PhotoService;
import com.example.nutritioncalculator.services.interfaces.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

@Configuration
@RequestMapping("/customers")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private PhotoService photoService;

    @Autowired
    private PostService postService;

    @GetMapping("/profile")
    public String userProfile(Principal principal, Model model) {
        String login = principal.getName();
        CustomerDto customer = customerService.getCustomer(login);
        model.addAttribute("user", customer);
        model.addAttribute("photo", photoService.getPhoto(customer.getId()));
        return "userprofile/myProfile";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "security/login";
    }

    @GetMapping("/update/{id}")
    public String edit(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("customer", customerService.getCustomer(id));
        return "userprofile/update";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute("customer") @Valid CustomerDto customerDto,
                         BindingResult bindingResult,
                         @PathVariable("id") Integer id) {
        if (bindingResult.hasErrors()) {
            return "userprofile/update";
        }
        customerService.updateCustomer(id, customerDto);
        return "redirect:/customers/profile";
    }

    @GetMapping("/my_posts")
    public String profile(Model model, Principal principal) {
        String login = principal.getName();
        model.addAttribute("customer", customerService.getCustomer(login));
        model.addAttribute("posts", postService.getAllCustomerPosts(login));
        return "posts/portalNews";
    }

    @GetMapping("/{login}/posts")
    public String getCustomerPosts(@PathVariable String login, Model model) {
        model.addAttribute("customer", customerService.getCustomer(login));
        model.addAttribute("posts", postService.getAllCustomerPosts(login));
        return "posts/portalNews";
    }
}
