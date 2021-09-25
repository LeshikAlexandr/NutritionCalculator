package com.example.nutritioncalculator.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "product_daily_menu")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDailyMenu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name = "daily_menu_id")
    private int dailyMenuId;

    @Column(name = "eating")
    @Enumerated(value = EnumType.STRING)
    private Eating eating;

    @Column(name = "product_weight")
    private int productWeight;
}
