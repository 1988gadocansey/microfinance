package com.gadeksystems.banking.service.user;

import com.gadeksystems.banking.models.User;
import com.gadeksystems.banking.models.UserCreateForm;

import java.util.Collection;
import java.util.Optional;

public interface UserService {

    Optional<User> getUserById(long id);

    User getUserByEmail(String email);
    User save(User user);

    Collection<User> getAllUsers();

    User create(UserCreateForm form);
    boolean validateEmail(String email);
}
