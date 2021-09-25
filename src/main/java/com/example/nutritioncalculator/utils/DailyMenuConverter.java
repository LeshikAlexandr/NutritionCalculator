package com.example.nutritioncalculator.utils;


import com.example.nutritioncalculator.controllers.dto.DailyMenuDto;
import com.example.nutritioncalculator.models.DailyMenu;
import lombok.experimental.UtilityClass;

@UtilityClass
public class DailyMenuConverter {

    public static DailyMenuDto convertDailyMenuEntityToDailyMenuDto(DailyMenu dailyMenu) {

        return DailyMenuDto.builder()
                .id(dailyMenu.getId())
                .generalCalories(dailyMenu.getGeneralCalories())
                .generalProteins(dailyMenu.getGeneralProteins())
                .generalFats(dailyMenu.getGeneralFats())
                .generalCarbohydrates(dailyMenu.getGeneralCarbohydrates())
                .createdDate(dailyMenu.getCreatedDate())
                .build();
    }

    public static DailyMenu convertDailyMenuDtoToDailyMenuEntity(DailyMenuDto dailyMenuDto) {

        return DailyMenu.builder()
                .id(dailyMenuDto.getId())
                .generalCalories(dailyMenuDto.getGeneralCalories())
                .generalProteins(dailyMenuDto.getGeneralProteins())
                .generalFats(dailyMenuDto.getGeneralFats())
                .generalCarbohydrates(dailyMenuDto.getGeneralCarbohydrates())
                .createdDate(dailyMenuDto.getCreatedDate())
                .build();
    }
}
