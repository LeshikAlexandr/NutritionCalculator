package com.example.nutritioncalculator.repositories;

import com.example.nutritioncalculator.api.WaitingPayment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WaitingPaymentRepository extends JpaRepository<WaitingPayment, Integer> {

    WaitingPayment findAllByCallback(String callback);
}
