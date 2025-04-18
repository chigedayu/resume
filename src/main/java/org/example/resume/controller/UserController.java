package org.example.resume.controller;


import org.example.resume.entity.User;
import org.example.resume.service.UserService;
import org.example.resume.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @PostMapping("/register")
    public Result<?> register(User user) {
        // 调用service
        return userService.register(user);
    }

    @PostMapping("/login")
    public Result<?> login(User user) {
        return userService.login (user);
    }

}