package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CommentDto;
import com.example.nutritioncalculator.services.CommentService;
import com.example.nutritioncalculator.services.CustomerService;
import com.example.nutritioncalculator.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;

@Controller
public class MainPaigeController {

    @Autowired
    private PostService postService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/profile")
    public String profile(Model model, Principal principal) {
        if (principal != null) {
            model.addAttribute("customer", customerService.getCustomer(principal.getName()));
        }
        model.addAttribute("posts", postService.getAllPosts());
        model.addAttribute("comments", commentService.getAllComments());
        return "profile";
    }

    @PostMapping("/newComment/{id}")
    public String createComment(@ModelAttribute("comment") CommentDto commentDto,
                                @RequestParam(value = "file", required = false) MultipartFile file,
                                @PathVariable("id") int postId,
                                Principal principal) {

        commentService.saveComment(file, commentDto, principal.getName(), postId);
        return "redirect:/profile";
    }

}
