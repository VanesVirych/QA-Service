package com.ivirych.qaapplication.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ivirych.qaapplication.dto.UserDto;
import com.ivirych.qaapplication.model.Role;
import com.ivirych.qaapplication.model.User;
import com.ivirych.qaapplication.model.UserStatus;
import com.ivirych.qaapplication.service.UserService;
import com.ivirych.qaapplication.util.UserMapper;


@Controller
public class AccessController {
	private static int ROLE_USER = 2;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        return "access/login";
    }
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup(Model model) {
		model.addAttribute("userAttribute", new UserDto());//edit
        return "access/signup";
    }
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String createAccount(Locale locale, UserDto dto, Model model) {
		model.addAttribute("userAttribute", new UserDto());
		if (userService.findUserByName(dto.getUsername()) != null) {
			model.addAttribute("status", "signup.invalid.username.duplicate");
			return "access/signup";
		}
		if (dto.getPassword().equals(dto.getRepassword()) == false) {
			model.addAttribute("status", "signup.invalid.password.notmatching");
			return "access/signup";
		}
		if (userService.findUserByEmail(dto.getEmail()) != null) {
			System.out.println("aa");
			model.addAttribute("status", "signup.invalid.email.duplicate");
			return "access/signup";
		}
		
		User user = UserMapper.map(dto);
		
		user.setStatus(UserStatus.ACTIVE);
		Date date = new Date();
		user.setCreated_at(date);
		
		Role rolee = new Role();
		rolee.setId(ROLE_USER);
		rolee.setName("User");
		List<Role> roles = new ArrayList<Role>();
		roles.add(rolee);
		user.setRoles(roles);
		
		userService.addUser(user);
		
		UserDetails userDetails = userDetailsService.loadUserByUsername(user.getUsername());
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails.getUsername(),
				    userDetails.getPassword(), userDetails.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return "redirect:/";
	}
}

