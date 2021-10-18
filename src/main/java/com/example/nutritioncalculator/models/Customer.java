package com.example.nutritioncalculator.models;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Data
@Table(name = "customer")
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Customer implements UserDetails {

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

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "customer_customer",
            joinColumns = @JoinColumn(name = "parent_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    @EqualsAndHashCode.Exclude
    private Set<Customer> followers;

    public void addFollower(Customer customer) {
        if (followers == null) {
            followers = new HashSet<>();
        }
        followers.add(customer);
    }

    @OneToMany(mappedBy = "customer")
    @EqualsAndHashCode.Exclude
    private Set<DailyMenu> dailyMenus;

    @OneToMany(mappedBy = "customer")
    @EqualsAndHashCode.Exclude
    private Set<Post> posts;

    @OneToMany(mappedBy = "customer")
    @EqualsAndHashCode.Exclude
    private Set<Comment> comment;

    @OneToMany(mappedBy = "customer")
    @EqualsAndHashCode.Exclude
    private Set<Photo> photos;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public String getUsername() {
        return getLogin();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String getPassword() {
        return password;
    }
}
