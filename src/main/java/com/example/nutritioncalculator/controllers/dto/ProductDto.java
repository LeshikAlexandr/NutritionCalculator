package com.example.nutritioncalculator.controllers.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {

    private int id;
    @Size(min = 3, message = "Количество знаков должно быть не менее 3")
    private String name;
    @Min(value = 0, message = "Калорийность должна быть больше 0")
    private int nominalCalories;
    @Min(value = 0, message = "Количество жиров не может быть меньше 0")
    private int fat;
    @Min(value = 0, message = "Количество белков не может быть меньше 0")
    private int protein;
    @Min(value = 0, message = "Количество углеводов не может быть меньше 0")
    private int carbohydrates;
    @Min(value = 0, message = "Вес не может быть меньше 0")
    private int weight;
    private int factualCalories;
    private int factualCarbohydrates;
    private int factualFat;
    private int factualProtein;

    private String eating;
}
