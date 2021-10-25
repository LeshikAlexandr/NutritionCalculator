package com.example.nutritioncalculator.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@Component
public class APIControllerService {

    public String send(EncodedPayment encodedPayment) {
        ObjectMapper objectMapper = new ObjectMapper();

        String url = "http://localhost:8081/get/link";

        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpPost httpPost = new HttpPost(url);
            StringEntity stringEntity = null;
            stringEntity = new StringEntity(objectMapper.writeValueAsString(encodedPayment));
            httpPost.setEntity(stringEntity);
            httpPost.setHeader("content-type", "application/json");
            HttpResponse response = httpClient.execute(httpPost);
            BufferedReader in = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String inputLine;
            StringBuffer response1 = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response1.append(inputLine);
            }
            in.close();
            return response1.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
