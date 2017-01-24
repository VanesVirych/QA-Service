package com.ivirych.qaapplication.util;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;

import com.ivirych.qaapplication.dto.UserDto;
import com.ivirych.qaapplication.model.User;

public class UserMapper {
	public static User map(UserDto dto) {
		User user = new User();
		user.setUsername(dto.getUsername());
		user.setEmail(dto.getEmail());
		PasswordEncoder encoder = new Md5PasswordEncoder();
		user.setPassword(encoder.encodePassword(dto.getPassword(), null));
		return user;
	}
}
