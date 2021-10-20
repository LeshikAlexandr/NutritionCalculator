package com.example.nutritioncalculator.services.interfaces;

import com.example.nutritioncalculator.models.Photo;
import org.springframework.web.multipart.MultipartFile;

public interface PhotoService {

    void saveOrUpdate(MultipartFile file, String login);

    Photo load(String fileName);

    Photo getPhoto(int customerId);

    Photo save(MultipartFile file);
}
