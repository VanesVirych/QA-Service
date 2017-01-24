package com.ivirych.qaapplication.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ivirych.qaapplication.model.Answer;
import com.ivirych.qaapplication.model.AnswerLike;
import com.ivirych.qaapplication.model.User;
import com.ivirych.qaapplication.service.AnswerLikeService;
import com.ivirych.qaapplication.service.AnswerService;
import com.ivirych.qaapplication.service.FavoriteService;
import com.ivirych.qaapplication.service.QuestionLikeService;
import com.ivirych.qaapplication.service.SearchService;
import com.ivirych.qaapplication.service.UserService;
import com.ivirych.qaapplication.service.QuestionService;

@Controller
public class AnswerController {

	@Autowired
	private QuestionService questionService;
	@Autowired
	private AnswerService answerService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private AnswerLikeService answerLikeService;
	@Autowired
	private QuestionLikeService questionLikeService;
	@Autowired
	private UserService userService;
	@Autowired
	private SearchService searchService;

	@RequestMapping(value = "/questions/{id}/add", method = RequestMethod.POST)
	public String postAddA(@ModelAttribute("answerAttribute") Answer answer,
			@PathVariable Integer id) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		answerService.add(id, authUsername, answer);
		return "redirect:/questions/{id}";
	}
	@RequestMapping(value = "/questions/{id}/edit", method = RequestMethod.GET)
	public String getEditA(@RequestParam("id") Integer answerId,
			@PathVariable Integer id, Model model) {
		Answer existingAnswer = answerService.getAnswer(answerId);
		model.addAttribute("question", questionService.getQuestion(id));
		model.addAttribute("limitedQuestions", questionService.getQuestions(5));
		model.addAttribute("answers", answerService.getAnswers(id));

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		if ((!authUsername.equals(existingAnswer.getUser().getUsername()))
				&& !userService.findUserByName(authUsername).getUsername()
						.equalsIgnoreCase("admin")) {
			model.addAttribute("answerAttribute", new Answer());
			return "question";
		}
		model.addAttribute("answerAttribute", existingAnswer);
		model.addAttribute("qid", id);
		return "question";
	}
	@RequestMapping(value = "/questions/{id}/edit", method = RequestMethod.POST)
	public String postEditA(@ModelAttribute("answerAttribute") Answer answer,
			@RequestParam("id") Integer answerId, @PathVariable Integer id) {
		answer.setId(answerId);

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		if ((!authUsername.equals(answerService.getAnswer(answerId).getUser()
				.getUsername()))
				&& !userService.findUserByName(authUsername).getUsername()
						.equalsIgnoreCase("admin")) {
			return "redirect:/questions/{id}";
		}
		answerService.edit(id, answer);
		return "redirect:/questions/{id}";
	}
	@RequestMapping(value = "/questions/{id}/delete", method = RequestMethod.GET)
	public String getDeleteA(@RequestParam("id") Integer answerId) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		if (!authUsername.equals(answerService.getAnswer(answerId).getUser()
				.getUsername())
				&& !userService.findUserByName(authUsername).getUsername()
						.equalsIgnoreCase("admin")) {
			return "redirect:/questions/{id}";
		}
		answerService.delete(answerId);
		return "redirect:/questions/{id}";
	}
	@RequestMapping(value = "/answer_like", method = RequestMethod.POST)
	@ResponseBody
	public String postAddAnswerLike(@RequestParam("aid") Integer answerId) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		User authUser = userService.findUserByName(authUsername);

		AnswerLike answerLike = new AnswerLike();
		answerLike.setAnswer(answerService.getAnswer(answerId));
		answerLike.setUser(authUser);

		int countExist = 0;
		for (AnswerLike al : authUser.getAnswerLikes()) {
			if (answerLike.getAnswer().equals(al.getAnswer())
					&& answerLike.getUser().equals(al.getUser())) {
				countExist++;
			}
		}
		if (countExist != 0) {
			answerLikeService.deleteAnswerLike(
					answerService.getAnswer(answerId), authUser);
		} else {
			answerLikeService.addAnswerLike(answerLike);
		}
		Integer num = answerService.getAnswer(answerId).getAnswerLikes().size();

		return num.toString();
	}
}