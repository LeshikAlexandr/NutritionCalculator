package com.example.nutritioncalculator.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Data
@Table(name = "customer")
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private int weight;
    private int height;
    private int age;
    @Enumerated(value = EnumType.STRING)
    private Sex sex;
    @Enumerated(value = EnumType.STRING)
    private Activity activity;
    private String password;
    private String login;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "customer_role",
            joinColumns = @JoinColumn(name = "customer_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @OneToMany(mappedBy = "customer")
    private Set<DailyMenu> dailyMenus;

    @OneToMany(mappedBy = "customer")
    private Set<Post> posts;

    @OneToMany(mappedBy = "customer")
    private Set<Comment> comment;

    @OneToMany(mappedBy = "customer")
    private Set<Photo> photos;
}
