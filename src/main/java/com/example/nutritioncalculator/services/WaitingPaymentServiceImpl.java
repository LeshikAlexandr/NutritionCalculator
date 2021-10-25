package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.api.WaitingPayment;
import com.example.nutritioncalculator.repositories.WaitingPaymentRepository;
import com.example.nutritioncalculator.services.interfaces.WaitingPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WaitingPaymentServiceImpl implements WaitingPaymentService {

    @Autowired
    private WaitingPaymentRepository waitingPaymentRepository;

    @Override
    public void save(WaitingPayment waitingPayment) {
        waitingPaymentRepository.saveAndFlush(waitingPayment);
    }

    @Override
    public WaitingPayment getWaitingPaymentByCallback(String callback) {
        return waitingPaymentRepository.findAllByCallback(callback);
    }
}
