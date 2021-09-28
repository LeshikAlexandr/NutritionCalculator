package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.PostDto;
import com.example.nutritioncalculator.models.Post;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import com.example.nutritioncalculator.repositories.PostRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    private static final Logger LOGGER = LogManager.getLogger(PostServiceImpl.class);

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private CustomerRepository customerRepository;

    // добавить фотосервис

    @Override
    public void savePost(MultipartFile file, PostDto postDto, String login) {

    }

    @Override
    public List<Post> getAllPosts() {
        return null;
    }
}
