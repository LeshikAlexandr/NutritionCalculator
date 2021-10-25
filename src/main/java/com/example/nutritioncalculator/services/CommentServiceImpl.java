package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.controllers.dto.CommentDto;
import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.models.Comment;
import com.example.nutritioncalculator.repositories.CommentRepository;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import com.example.nutritioncalculator.repositories.PostRepository;
import com.example.nutritioncalculator.services.interfaces.CommentService;
import com.example.nutritioncalculator.services.interfaces.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private PhotoService photoService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private PostRepository postRepository;

    @Override
    public void saveComment(MultipartFile file, CommentDto commentDto, String login, int postId) {

        Comment comment = Comment.builder()
                .post(postRepository.getById(postId))
                .text(commentDto.getText())
                .photo(photoService.save(file))
                .createdDate(LocalDateTime.now())
                .customer(customerRepository.findCustomerByLogin(login)
                        .orElseThrow(() -> new Exception("Не удалось найти фото, не существует пользователя с логином:" + login)))
                .build();
        commentRepository.save(comment);
    }

    @Override
    public Comment getComment(int id) {
        return commentRepository.findById(id).orElseThrow(() -> new Exception("Не удалось найти комментарий"));
    }

    @Override
    public List<Comment> getAllComments() {
        return null;
    }

    @Override
    public List<Comment> getCommentsFromPost(int postId) {
        return commentRepository.getByPostId(postId);
    }

    @Override
    public void deleteComment(int id) {
        commentRepository.deleteById(id);
    }
}
