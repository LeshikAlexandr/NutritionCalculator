package com.example.nutritioncalculator.models;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Sex {

    MEN("Мужской"),
    WOMEN("Женский");

    private final String code;
}
