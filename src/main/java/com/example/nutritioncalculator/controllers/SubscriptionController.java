package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.services.interfaces.CustomerService;
import com.example.nutritioncalculator.services.interfaces.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/subscriptions")
public class SubscriptionController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private PostService postService;


    @GetMapping("/all-customers")
    public String getAllCustomers(Principal principal, Model model) {
        String login = principal.getName();
        CustomerDto customerDto = customerService.getCustomer(login);
        model.addAttribute("customer", customerDto);
        model.addAttribute("customers", customerService.getAllCustomer());
        return "subscriptions/allCustomers";
    }

    @PostMapping("/add_subscriber/{id}")
    public String addSubscriber(@PathVariable("id") int id, Principal principal) {
        String login = principal.getName();
        customerService.addSubscribe(login, id);
        return "redirect:/subscriptions/all-customers";
    }

    @GetMapping("/{login}/posts")
    public String getCustomerPosts(@PathVariable("login") String login, Model model) {
        model.addAttribute("customerPosts", postService.getAllCustomerPosts(login));
        return "subscriptions/someCustomerPage";
    }

    @PostMapping("/delete_subscriber/{id}")
    public String deleteSubscriber(@PathVariable("id") int id, Principal principal) {
        String login = principal.getName();
        customerService.deleteSubscribe(login, id);
        return "redirect:/subscriptions/all-customers";
    }

    @GetMapping("/my_subscriptions")
    public String getMySubscriptions(Model model, Principal principal) {
        String login = principal.getName();
        CustomerDto customerDto = customerService.getCustomer(login);
        model.addAttribute("customer", customerDto);
        model.addAttribute("customers", customerService.getAllSubscribers(login));
        return "subscriptions/allCustomers";
    }

}
