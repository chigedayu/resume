package org.example.resume.service;

import org.example.resume.entity.User;
import org.example.resume.util.Result;

public interface UserService {
    Result register(User user);

    Result<User> login(User user);
}
