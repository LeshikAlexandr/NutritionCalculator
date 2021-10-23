package com.example.nutritioncalculator.models;

import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Map;

@Data
@Entity
@Table(name = "comment")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String text;
    private LocalDateTime createdDate;

    @ManyToOne
//    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "post_id")
    @EqualsAndHashCode.Exclude
    private Post post;

    @OneToOne(optional = true, cascade = CascadeType.ALL)
    @JoinColumn(name = "photo_id")
    @EqualsAndHashCode.Exclude
    private Photo photo;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    @EqualsAndHashCode.Exclude
    private Customer customer;

}
