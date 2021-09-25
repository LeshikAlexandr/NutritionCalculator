package com.example.nutritioncalculator.services;

import com.example.nutritioncalculator.exceptions.Exception;
import com.example.nutritioncalculator.models.Customer;
import com.example.nutritioncalculator.models.Role;
import com.example.nutritioncalculator.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.stream.Collectors;

@Service
public class CustomerService implements UserDetailsService {

    @Autowired
    private CustomerRepository customerRepository;

    public Customer findByLogin(String login) {
        return customerRepository.findCustomerByLogin(login).orElseThrow(() -> new Exception("Не удалось найти пользователя"));
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Customer customer = findByLogin(login);
        return new org.springframework.security.core.userdetails.User(customer.getLogin(), customer.getPassword(),
                mapRolesToAuthorities(customer.getRoles()));
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream().map(r -> new SimpleGrantedAuthority(r.getName())).collect(Collectors.toList());
    }
}
