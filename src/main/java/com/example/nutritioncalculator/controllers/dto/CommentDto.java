package com.example.nutritioncalculator.controllers.dto;

import com.example.nutritioncalculator.models.Photo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {

    private Photo photo;
    @Length(min = 1, message = "Количество символов должно быть не менее 1")
    private String text;
    private LocalDateTime createdDate;
    private CustomerDto customerDto;

    private PostDto postDto;
}
