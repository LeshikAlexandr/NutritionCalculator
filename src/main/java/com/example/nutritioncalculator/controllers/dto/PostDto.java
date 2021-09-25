package com.example.nutritioncalculator.controllers.dto;

import com.example.nutritioncalculator.models.Photo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PostDto {

    private Photo photo;
    private String text;
    @DateTimeFormat(pattern = "MMMM dd, yyyy")
    private LocalDateTime createdDate;
    private CustomerDto customerDto;
}
