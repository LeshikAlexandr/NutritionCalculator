package com.example.nutritioncalculator.repositories;

import com.example.nutritioncalculator.models.DailyMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface DailyMenuRepository extends JpaRepository<DailyMenu, Integer> {

    List<DailyMenu> findAllByCustomerId(int id);

    Optional<DailyMenu> findByCustomerLoginAndCreatedDate(String login, LocalDate createdDate);

}
