package com.example.nutritioncalculator.models;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Sex {

    MALE("Мужской"),
    FEMALE("Женский");

    private final String code;
}
