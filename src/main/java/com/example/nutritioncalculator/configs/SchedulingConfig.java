package com.example.nutritioncalculator.configs;

import com.example.nutritioncalculator.services.DailyMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
@ConditionalOnProperty(name = "scheduler.enabled", matchIfMissing = true)
public class SchedulingConfig {

    @Autowired
    private DailyMenuService dailyMenuService;

    /**
     * Method save Daily Menu for every customer every day at 12 am
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void createDailyMenuForAllCustomersTask() {
        dailyMenuService.saveDailyMenuForEveryCustomer();
    }
}
