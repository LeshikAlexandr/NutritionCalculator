package com.example.nutritioncalculator.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;

@Component
public class CryptoService {

    @Autowired
    private Cipher cipher;

    private static String key = "9s81al02ocbt7sjf";

    @SneakyThrows
    public String decode(byte[] data, String privateKey) {
        byte[] key = privateKey.getBytes(StandardCharsets.UTF_8);
        System.out.println(key.length);
        SecretKeySpec k = new SecretKeySpec(key, "AES");
        cipher.init(Cipher.DECRYPT_MODE, k);
        byte[] decryptedData = cipher.doFinal(data);
        return new String(decryptedData, StandardCharsets.UTF_8);
    }

    @SneakyThrows
    public byte[] encode(String data, String privateKey) {
        byte[] key = privateKey.getBytes(StandardCharsets.UTF_8);
        byte[] dataToSend = data.getBytes(StandardCharsets.UTF_8);
        Cipher c = Cipher.getInstance("AES");
        SecretKeySpec k = new SecretKeySpec(key, "AES");
        c.init(Cipher.ENCRYPT_MODE, k);
        return c.doFinal(dataToSend);
    }

    @SneakyThrows
    public DecodedPayment decodeToPayment(EncodedPayment encodedPayment) {
        String data = decode(encodedPayment.getData(), key);
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(data, DecodedPayment.class);
    }

    @SneakyThrows
    public EncodedPayment encodeToPayment(DecodedPayment decodedPayment) {
        EncodedPayment encodedPayment = new EncodedPayment();

        ObjectMapper obj = new ObjectMapper();
        try {
            String jsonStr = obj.writeValueAsString(decodedPayment);
            encodedPayment.setData(encode(jsonStr, key));
            encodedPayment.setStoreId(decodedPayment.getStoreId());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return encodedPayment;
    }


    @SneakyThrows
    public DecodedPaymentResponse getDecodedPaymentResponse(EncodedPaymentResponse encodedPaymentResponse, String key) {
        String data = decode(encodedPaymentResponse.getData(), key);
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(data, DecodedPaymentResponse.class);
    }


    public EncodedPaymentResponse getEncodedPaymentResponse(DecodedPaymentResponse decodedPaymentResponse, String key) {
        EncodedPaymentResponse encodedPaymentResponse = new EncodedPaymentResponse();

        ObjectMapper obj = new ObjectMapper();
        try {
            String jsonStr = obj.writeValueAsString(decodedPaymentResponse);
            encodedPaymentResponse.setData(encode(jsonStr, key));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return encodedPaymentResponse;
    }
}
