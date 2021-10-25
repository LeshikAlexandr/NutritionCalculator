package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.api.CryptoService;
import com.example.nutritioncalculator.api.DecodedPaymentResponse;
import com.example.nutritioncalculator.api.EncodedPaymentResponse;
import com.example.nutritioncalculator.api.WaitingPayment;
import com.example.nutritioncalculator.services.WaitingPaymentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class APIRestController {

    @Autowired
    @Qualifier("getKey")
    private String key;

    @Autowired
    private CryptoService cryptoService;

    @Autowired
    private WaitingPaymentServiceImpl waitingPaymentService;

    @PostMapping(value = "/get/response/{url}", consumes = "application/json")
    public void getResponse(@RequestBody EncodedPaymentResponse encodedPaymentResponse, @PathVariable String url) {
        DecodedPaymentResponse decodedPaymentResponse = cryptoService.getDecodedPaymentResponse(encodedPaymentResponse, key);
        if (decodedPaymentResponse.getStatus().equals("ACCEPTED")) {
            WaitingPayment waitingPayment = waitingPaymentService.getWaitingPaymentByCallback(url);
            waitingPayment.setStatus(true);
        }
    }
}
