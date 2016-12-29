package com.gadeksystems.banking.service.currentuser;

import com.gadeksystems.banking.models.CurrentUser;

public interface CurrentUserService {

    boolean canAccessUser(CurrentUser currentUser, Long userId);

}
