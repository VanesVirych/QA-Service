package com.ivirych.qaapplication.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ivirych.qaapplication.service.UserService;

@Controller
public class ProfileController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String getProfile(Locale locale, Model model) {		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("user", userService.findUserByName(auth.getName()));
		return "profile/profile";
	}
	@RequestMapping(value = "/profile/questions", method = RequestMethod.GET)
	public String getProfileQuestions(Locale locale, Model model) {		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   		String authUsername = auth.getName();
   		model.addAttribute("authUserFavorites", userService.findUserByName(authUsername).getFavorites());
  		model.addAttribute("authUserQuestionLikes", userService.findUserByName(authUsername).getQuestionLikes());
		model.addAttribute("questions", userService.findUserByName(auth.getName()).getQuestions());
		return "profile/my-questions";
	}
	@RequestMapping(value = "/profile/answers", method = RequestMethod.GET)
	public String getProfileAnswers(Locale locale, Model model) {		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   		String authUsername = auth.getName();
   		model.addAttribute("authUserAnswerLikes", userService.findUserByName(authUsername).getAnswerLikes());
		model.addAttribute("answers", userService.findUserByName(auth.getName()).getAnswers());
		return "profile/my-answers";
	}
	@RequestMapping(value = "/profile/favorite", method = RequestMethod.GET)
	public String getProfileFavoriteQuestions(Locale locale, Model model) {		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String authUsername = auth.getName();
		model.addAttribute("authUserFavorites", userService.findUserByName(authUsername).getFavorites());
		model.addAttribute("authUserQuestionLikes", userService.findUserByName(authUsername).getQuestionLikes());
		return "profile/my-favorites";
	}
	@RequestMapping(value = "/profile/like_questions", method = RequestMethod.GET)
	public String getProfileLikeQuestions(Locale locale, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		model.addAttribute("questionLikes", userService.findUserByName(auth.getName()).getQuestionLikes());
   		String authUsername = auth.getName();
   		model.addAttribute("authUserFavorites", userService.findUserByName(authUsername).getFavorites());
   		model.addAttribute("authUserQuestionLikes", userService.findUserByName(authUsername).getQuestionLikes());
		return "profile/my-question-likes";
	}
	@RequestMapping(value = "/profile/like_answers", method = RequestMethod.GET)
	public String getProfileLikeAnswers(Locale locale, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   		String authUsername = auth.getName();
   		model.addAttribute("authUserAnswerLikes", userService.findUserByName(authUsername).getAnswerLikes());
		model.addAttribute("answerLikes", userService.findUserByName(auth.getName()).getAnswerLikes());
		return "profile/my-answer-likes";
	}
}
