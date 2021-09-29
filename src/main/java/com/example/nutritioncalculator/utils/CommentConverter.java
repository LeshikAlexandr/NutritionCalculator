package com.example.nutritioncalculator.utils;


import com.example.nutritioncalculator.controllers.dto.CommentDto;
import com.example.nutritioncalculator.models.Comment;
import lombok.experimental.UtilityClass;

@UtilityClass
public class CommentConverter {

    public static CommentDto convertCommentEntityToCommentDto(Comment comment) {

        return CommentDto.builder()
                .text(comment.getText())
                .postDto(PostConverter.convertPostEntityToPostDto(comment.getPost()))
                .customerDto(CustomerConverter.convertCustomerEntityToCustomerDto(comment.getCustomer()))
                .photo(comment.getPhoto())
                .createdDate(comment.getCreatedDate())
                .build();
    }

    public static Comment convertCommentDtoToCommentEntity(CommentDto commentDto) {
        return Comment.builder()
                .text(commentDto.getText())
                .post(PostConverter.convertPostDtoToPostEntity(commentDto.getPostDto()))
                .customer(CustomerConverter.convertCustomerDtoToCustomerEntity(commentDto.getCustomerDto()))
                .photo(commentDto.getPhoto())
                .createdDate(commentDto.getCreatedDate())
                .build();
    }
}
