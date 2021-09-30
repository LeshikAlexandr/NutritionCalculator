package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.PostDto;
import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.models.Post;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import com.example.nutritioncalculator.repositories.PostRepository;
import com.example.nutritioncalculator.utils.CustomerConverter;
import com.example.nutritioncalculator.utils.PostConverter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PostServiceImpl implements PostService {

    private static final Logger LOGGER = LogManager.getLogger(PostServiceImpl.class);

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private PhotoService photoService;

    private final Path PhotoDirectoryPath = Paths.get("src/main/resources/static");

    @Override
    public void savePost(MultipartFile file, PostDto postDto, String login) {
        if (file.getSize() != 0) {
            postDto.setPhoto(photoService.save(file, login));
        }
        postDto.setCreatedDate(LocalDateTime.now());
        postDto.setCustomerDto(CustomerConverter.convertCustomerEntityToCustomerDto(customerRepository.findCustomerByLogin(login)
                .orElseThrow(() -> new Exception("Не удалось найти пользователя"))));

        postRepository.save(PostConverter.convertPostDtoToPostEntity(postDto));
    }

    @Override
    public List<Post> getAllPosts() {
        return postRepository.findAll()
                .stream()
                .sorted(Comparator.comparing(Post::getCreatedDate)
                        .reversed())
                .collect(Collectors.toList());
    }
}
