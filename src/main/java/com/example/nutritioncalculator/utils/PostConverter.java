package com.example.nutritioncalculator.utils;

import com.example.nutritioncalculator.controllers.dto.PostDto;
import com.example.nutritioncalculator.models.Post;
import lombok.experimental.UtilityClass;

@UtilityClass
public class PostConverter {

    public static PostDto convertPostEntityToPostDto(Post post) {

        return PostDto.builder()
                .title(post.getTitle())
                .text(post.getText())
                .customerDto(CustomerConverter.convertCustomerEntityToCustomerDto(post.getCustomer()))
                .photo(post.getPhoto())
                .createdDate(post.getCreatedDate())
                .build();
    }

    public static Post convertPostDtoToPostEntity(PostDto postDto) {
        return Post.builder()
                .title(postDto.getTitle())
                .text(postDto.getText())
                .customer(CustomerConverter.convertCustomerDtoToCustomerEntity(postDto.getCustomerDto()))
                .photo(postDto.getPhoto())
                .createdDate(postDto.getCreatedDate())
                .build();
    }
}
