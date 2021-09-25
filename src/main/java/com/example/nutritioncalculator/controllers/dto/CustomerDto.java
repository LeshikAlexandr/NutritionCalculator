package com.example.nutritioncalculator.controllers.dto;


import com.example.nutritioncalculator.models.Activity;
import com.example.nutritioncalculator.models.Role;
import com.example.nutritioncalculator.models.Sex;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustomerDto {

    private int id;
    private String name;
    @Min(value = 0, message = "Вес должен быть больше 0")
    @Max(value=700, message = "Вес должен быть меньше 700")
    private int weight;
    @Min(value = 0, message = "Рост должен быть больше 0")
    @Max(value=280, message = "Рост должен быть меньше 280")
    private int height;
    @Min(value = 0, message = "Возраст должен быть больше 0")
    @Max(value=99, message = "Возраст должен быть меньше 100")
    private int age;
    private Sex sex;
    private Activity activity;
    private String login;
    private String password;
    private Set<Role> roles;
    private double basicMetabolism;
    private double weightLossCalories;
    private double weightGainCalories;
    private double weightMaintainCalories;
}
