package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.controllers.dto.CustomerDto;
import com.example.nutritioncalculator.controllers.dto.CustomerRegistrationDto;
import com.example.nutritioncalculator.services.CustomerService;
import com.example.nutritioncalculator.services.PhotoService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class MainController {

    private static final Logger LOGGER = LogManager.getLogger(MainController.class);

    @Autowired
    private CustomerService customerService;

    @Autowired
    private PhotoService photoService;

    @GetMapping("/")
    public String mainPaige() {
        return "mainPaige";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("customer", new CustomerRegistrationDto());
        return "mainpaige/registration";
    }

    @PostMapping("/registration")
    public String addCustomer(@ModelAttribute("customer") @Valid CustomerRegistrationDto customerRegistrationDto,
                              BindingResult bindingResult,
                              Model model) {
        System.out.println(customerRegistrationDto.getLogin());
        if (bindingResult.hasErrors()) {
            return "mainpaige/registration";
        }
        if (!customerService.saveCustomer(customerRegistrationDto)) {
            model.addAttribute("customerError", "Пользователь с таким именем уже существует");
            return "mainpaige/registration";
        }
        return "redirect:/";
    }

    @GetMapping("/catalog")
    public String catalog() {
        return "mainpaige/catalog";
    }

    @GetMapping("/upload")
    public String getUploadForm(Model model) {
        model.addAttribute("uploadForm", new CustomerDto());
        return "uploadFile";
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, Model model, Principal principal) {
        try {
            photoService.saveOrUpdate(file, principal.getName());
            model.addAttribute("message", "Файл загружен успешно:" + file.getOriginalFilename());
            return "uploadFile";
        } catch (Exception e) {
            LOGGER.error("Возникла ошибка при сохранении файла", e);
            model.addAttribute("message", "Не удалось загрузить файл: " + file.getOriginalFilename());
            return "uploadFile";
        }
    }
}
