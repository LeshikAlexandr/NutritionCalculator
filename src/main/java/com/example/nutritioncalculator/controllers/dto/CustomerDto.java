package com.example.nutritioncalculator.controllers.dto;


import com.example.nutritioncalculator.models.*;
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
    @Min(value = 1, message = "Вес должен быть 1 и больше")
    @Max(value=700, message = "Вес должен быть меньше 700")
    private int weight;
    @Min(value = 1, message = "Рост должен быть 1 и больше")
    @Max(value=280, message = "Рост должен быть меньше 280")
    private int height;
    @Min(value = 1, message = "Возраст должен быть 1 и больше")
    @Max(value=99, message = "Возраст должен быть меньше 100")
    private int age;
    private Sex sex;
    private Activity activity;
    private String login;
    private String password;
    private Set<Role> roles;
    private Set<Customer> followers;
    private Set<String> usernames;
    private Photo photo;
    private double basicMetabolism;
    private double weightLossCalories;
    private double weightGainCalories;
    private double weightMaintainCalories;
}
