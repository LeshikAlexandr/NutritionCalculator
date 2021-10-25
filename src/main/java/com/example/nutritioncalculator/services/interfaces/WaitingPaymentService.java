package com.example.nutritioncalculator.services.interfaces;

import com.example.nutritioncalculator.api.WaitingPayment;

public interface WaitingPaymentService {

    void save(WaitingPayment waitingPayment);

    WaitingPayment getWaitingPaymentByCallback(String callback);
}
