package com.gadeksystems.banking.service.user;

import com.gadeksystems.banking.models.User;
import com.gadeksystems.banking.models.UserCreateForm;

import java.util.Collection;
import java.util.Optional;

public interface UserService {

    Optional<User> getUserById(long id);

    Optional<User> getUserByEmail(String email);

    Collection<User> getAllUsers();

    User create(UserCreateForm form);

}