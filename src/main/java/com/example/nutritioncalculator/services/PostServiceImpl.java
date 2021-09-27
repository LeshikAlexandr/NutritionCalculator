package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.PostDto;
import com.example.nutritioncalculator.models.Post;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Override
    public void savePost(MultipartFile file, PostDto postDto, String login) {

    }

    @Override
    public List<Post> getAllPosts() {
        return null;
    }
}
