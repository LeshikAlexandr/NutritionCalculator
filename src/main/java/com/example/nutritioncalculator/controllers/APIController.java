package com.example.nutritioncalculator.controllers;

import com.example.nutritioncalculator.api.*;
import com.example.nutritioncalculator.services.WaitingPaymentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;

@Controller
@RequestMapping("/api")
public class APIController {

    @Autowired
    private CryptoService cryptoService;

    @Autowired
    private APIControllerService apiControllerService;

    @Autowired
    private GenerationService generationService;

    @Autowired
    private WaitingPaymentServiceImpl waitingPaymentService;

    @GetMapping
    public String apiTest() {
        return "api/test";
    }

    @PostMapping("/test/send")
    public String callSend(@ModelAttribute("currency") String currency,
                           @ModelAttribute("amount") String amount) {
        DecodedPayment decodedPayment = new DecodedPayment();
        decodedPayment.setStoreId("testtest");
        decodedPayment.setCurrency(currency);
        decodedPayment.setAmount(amount);
        WaitingPayment waitingPayment = new WaitingPayment();
        waitingPayment.setCallback(generationService.generateLink());
        waitingPayment.setStatus(false);
        decodedPayment.setCallbackUrl(waitingPayment.getCallback());
        waitingPaymentService.save(waitingPayment);
        return "redirect:" + apiControllerService.send(cryptoService.encodeToPayment(decodedPayment));
    }

    @GetMapping("/test/{url}")
    public String confirmation(@PathVariable String url, Model model) {
        model.addAttribute("payment", waitingPaymentService.getWaitingPaymentByCallback(url));
        return "api/confirmation";
    }
}
