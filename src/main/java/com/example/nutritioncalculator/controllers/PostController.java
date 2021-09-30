package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CommentDto;
import com.example.nutritioncalculator.controllers.dto.PostDto;
import com.example.nutritioncalculator.models.Post;
import com.example.nutritioncalculator.services.CommentService;
import com.example.nutritioncalculator.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/posts")
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/new")
    public String newPost(Model model) {
        List<Post> allPosts = postService.getAllPosts();
        model.addAttribute("post", new PostDto());
        return "posts/new";
    }

    @PostMapping("/new")
    public String create(@ModelAttribute("post") PostDto postDto,
                         @RequestParam(value = "file", required = false) MultipartFile file,
                         Principal principal) {
        postService.savePost(file, postDto, principal.getName());
        return "redirect:/profile";
    }
}
