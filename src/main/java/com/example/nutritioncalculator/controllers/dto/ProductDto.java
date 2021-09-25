package com.example.nutritioncalculator.controllers.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {

    private int id;
    private String name;
    @Min(value = 0, message = "Калорийность должна быть больше 0")
    private int nominalCalories;
    @Min(value = 0, message = "Количество жиров не может быть меньше 0")
    private int fat;
    @Min(value = 0, message = "Количество белков не может быть меньше 0")
    private int protein;
    @Min(value = 0, message = "Количество углеводов не может быть меньше 0")
    private int carbohydrates;
    private int weight;
    private int factualCalories;
    private int factualCarbohydrates;
    private int factualFat;
    private int factualProtein;

    private String eating;
}
