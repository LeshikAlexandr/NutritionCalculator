package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.models.Photo;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import com.example.nutritioncalculator.repositories.PhotoRepository;
import com.example.nutritioncalculator.services.interfaces.PhotoService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class PhotoServiceImpl implements PhotoService {

    private static final Logger LOGGER = LogManager.getLogger(PostServiceImpl.class);
    private final PhotoRepository photoRepository;
    private final CustomerRepository customerRepository;

    private final Path photoDirectoryPath = Paths.get("src/main/resources/static/images");

    public PhotoServiceImpl(PhotoRepository photoRepository, CustomerRepository customerRepository) {
        this.photoRepository = photoRepository;
        this.customerRepository = customerRepository;
        init();
    }

    @Override
    public void saveOrUpdate(MultipartFile file, String login) {
        try {
            Files.copy(file.getInputStream(), this.photoDirectoryPath.resolve(file.getOriginalFilename()));

            Photo photo = photoRepository.findByCustomerLogin(login)
                    .orElseGet(() -> Photo.builder()
                            .customer(customerRepository.findCustomerByLogin(login)
                                    .orElseThrow(() -> new Exception("Не удалось найти фото, не существует пользователя с логином:" + login)))
                            .build());
            photo.setName(file.getOriginalFilename());
            photo.setUrl("/images/" + file.getOriginalFilename());
            photoRepository.save(photo);
        } catch (Exception | IOException e) {
            LOGGER.error("Возникла ошибка при сохранении фото", e);
            throw new Exception("Не удалось сохранить фото");
        }
    }

    @Override
    public Photo load(String filename) {
        return photoRepository.findByName(filename)
                .orElseThrow(() -> new Exception("Не удалось загрузить фото"));
    }

    @Override
    public Photo getPhoto(int customerId) {
        return photoRepository.findByCustomerId(customerId).orElse(null);
    }

    @Override
    public Photo save(MultipartFile file) {
        if (file.getSize() == 0) {
            return null;
        }
        try {
            Files.copy(file.getInputStream(), this.photoDirectoryPath.resolve(file.getOriginalFilename()));
            Photo photo = new Photo();
            photo.setName(file.getOriginalFilename());
            photo.setUrl("/images/" + file.getOriginalFilename());
//            photo.setCustomer(customerRepository.findCustomerByLogin(login)
//                    .orElseThrow(() -> new Exception("Не удалось найти фото, не существует пользователя с логином:" + login)));
            photoRepository.save(photo);
            return photo;
        } catch (Exception | IOException e) {
            throw new RuntimeException("Не удалось сохранить фото", e);
        }
    }

    private void init() {
        if (Files.exists(photoDirectoryPath)) {
            return;
        }
        try {
            Files.createDirectory(photoDirectoryPath);
        } catch (IOException e) {
            throw new RuntimeException("Не удалось загрузить фото!", e);
        }
    }
}
