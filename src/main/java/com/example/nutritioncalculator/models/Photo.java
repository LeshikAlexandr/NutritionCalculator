package com.example.nutritioncalculator.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "photo")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Photo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String url;

    @OneToOne(mappedBy = "photo")
    private Post post;

    @OneToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    public Photo(String name) {
        this.name = name;
    }

}
