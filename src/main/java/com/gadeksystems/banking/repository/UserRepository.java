package com.gadeksystems.banking.repository;

import com.gadeksystems.banking.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    User findOneByEmail(String email);
}
