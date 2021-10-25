package com.example.nutritioncalculator.api;

import org.springframework.stereotype.Component;
import java.util.Random;

@Component
public class GenerationService {
    private final Random rand = new Random();

    public String generateLink(){
        StringBuilder link = new StringBuilder("");
        for (int i = 0; i < 48; i++) {
            int a = rand.nextInt(50 + 1);
            if (a > 24) {
                link.append(String.valueOf(a).charAt(String.valueOf(a).length() - 1));
            } else {
                link.append(getAlphabet()[a]);
            }

        }
        return link.toString().toUpperCase();
    }

    private char[] getAlphabet() {
        return "abcdefghijklmnopqrstuvwxyz".toCharArray();
    }
}
