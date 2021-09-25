package com.example.nutritioncalculator.controllers.dto;

import com.example.nutritioncalculator.models.Photo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {

    private Photo photo;
    private String text;
    private LocalDateTime createdDate;
    private CustomerDto customerDto;
}
