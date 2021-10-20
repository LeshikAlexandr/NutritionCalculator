package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.models.Photo;
import com.example.nutritioncalculator.services.interfaces.PhotoService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;

@Controller
public class PhotoController {

    private static final Logger LOGGER = LogManager.getLogger(PhotoController.class);

    @Autowired
    private PhotoService photoService;

    @GetMapping("/upload")
    public String getUploadForm(Model model) {
        model.addAttribute("uploadForm", new CustomerDto());
        return "upload/uploadFile";
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, Model model, Principal principal) {
        try {
            photoService.saveOrUpdate(file, principal.getName());
            model.addAttribute("message", "Файл загружен успешно: " + file.getOriginalFilename());
            return "upload/uploadFile";
        } catch (Exception e) {
            LOGGER.error("Возникла ошибка при сохранении файла", e);
            model.addAttribute("message", "Не удалось загрузить файл: " + file.getOriginalFilename());
            return "upload/uploadFile";
        }
    }

    @GetMapping("/files/{filename}")
    public String getPhoto(@PathVariable("filename") String filename, Model model) {
        try {
            Photo photo = photoService.load(filename);
            model.addAttribute("url", photo.getUrl());
            return "redirect:/customers/profile";
        } catch (Exception e) {
            LOGGER.error("Возникла ошибка при загрузке файла", e);
            model.addAttribute("message", "Не удалось загрузить фотографию");
            return "redirect:/customers/profile";
        }
    }
}
