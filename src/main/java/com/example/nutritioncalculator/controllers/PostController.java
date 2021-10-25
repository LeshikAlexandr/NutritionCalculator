package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CommentDto;
import com.example.nutritioncalculator.controllers.dto.PostDto;
import com.example.nutritioncalculator.models.Comment;
import com.example.nutritioncalculator.models.Post;
import com.example.nutritioncalculator.services.interfaces.CommentService;
import com.example.nutritioncalculator.services.interfaces.CustomerService;
import com.example.nutritioncalculator.services.interfaces.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/posts")
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private CustomerService customerService;

    @GetMapping("/new")
    public String newPost(Model model) {
        List<Post> allPosts = postService.getAllPosts();
        model.addAttribute("post", new PostDto());
        return "posts/new";
    }

    @PostMapping("/new")
    public String create(@ModelAttribute("post") @Valid PostDto postDto,
                         BindingResult bindingResult,
                         @RequestParam(value = "file", required = false) MultipartFile file,
                         Principal principal) {
        if (bindingResult.hasErrors()) {
            return "posts/new";
        }
        postService.savePost(file, postDto, principal.getName());
        return "redirect:/";
    }

    @GetMapping("/{id}")
    public String showPost(@PathVariable("id") int id, Model model, Principal principal) {
        model.addAttribute("customer", customerService.getCustomer(principal.getName()));
        model.addAttribute("post", postService.getPost(id));
        model.addAttribute("comment", new CommentDto());
        return "posts/showPost";
    }

    @PostMapping("/newComment/{id}")
    public String createComment(@ModelAttribute("comment") @Valid CommentDto commentDto,
                                BindingResult bindingResult,
                                @RequestParam(value = "file", required = false) MultipartFile file,
                                @PathVariable("id") int postId,
                                Principal principal) {
        if (bindingResult.hasErrors()) {
            return "redirect:/";
        }
        commentService.saveComment(file, commentDto, principal.getName(), postId);
        return "redirect:/posts/" + postId;
    }

    @PostMapping("/comment/delete/{id}")
    public String deleteComment(@PathVariable("id") int id) {
        Comment comment = commentService.getComment(id);
        int postId = comment.getPost().getId();
        commentService.deleteComment(id);
        return "redirect:/posts/" + postId;
    }

    @PostMapping("/delete/{id}")
    public String deletePost(@PathVariable("id") Integer id) {
        postService.deletePost(id);
        return "redirect:/customers/my_posts";
    }
}
