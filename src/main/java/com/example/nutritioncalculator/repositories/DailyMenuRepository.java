package com.example.nutritioncalculator.repositories;

import com.example.nutritioncalculator.models.DailyMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DailyMenuRepository extends JpaRepository<DailyMenu, Integer> {
}
