package com.example.nutritioncalculator.models;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Activity {

    LOW("Низкая"),
    MEDIUM("Средняя"),
    HIGH("Высокая");

    private final String code;

}
