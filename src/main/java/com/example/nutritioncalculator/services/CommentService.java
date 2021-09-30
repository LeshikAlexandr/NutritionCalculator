package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.CommentDto;
import com.example.nutritioncalculator.models.Comment;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CommentService {

    void saveComment(MultipartFile file, CommentDto commentDto, String login, int postId);

    List<Comment> getAllComments();

    List<Comment> getCommentsFromPost(int postId);
}
