package com.vinixnan.user.dal;

import com.vinixnan.user.model.User;
import java.util.List;

public interface UserDAL {

    List<User> getAllUsers();

    User getUserById(String userId);

    User addNewUser(User user);

    Object getAllUserSettings(String userId);

    String getUserSetting(String userId, String key);

    String addUserSetting(String userId, String key, String value);
}
