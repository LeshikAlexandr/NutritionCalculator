package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.PostDto;
import com.example.nutritioncalculator.models.Post;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface PostService {

    void savePost(MultipartFile file, PostDto postDto, String login);

    List<Post> getAllPosts();

}
