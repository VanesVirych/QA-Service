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
import com.ivirych.qaapplication.model.Favorite;
import com.ivirych.qaapplication.model.Question;
import com.ivirych.qaapplication.model.QuestionLike;
import com.ivirych.qaapplication.model.User;
import com.ivirych.qaapplication.service.AnswerLikeService;
import com.ivirych.qaapplication.service.AnswerService;
import com.ivirych.qaapplication.service.FavoriteService;
import com.ivirych.qaapplication.service.QuestionLikeService;
import com.ivirych.qaapplication.service.SearchService;
import com.ivirych.qaapplication.service.UserService;
import com.ivirych.qaapplication.service.QuestionService;

@Controller
public class QuestionController {

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("questions", questionService.getQuestions());
		model.addAttribute("limitedQuestions", questionService.getQuestions(5));
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!auth.getName().equals("anonymousUser")) {
			String authUsername = auth.getName();
			model.addAttribute("authUserFavorites",
					userService.findUserByName(authUsername).getFavorites());
			model.addAttribute("authUserQuestionLikes", userService
					.findUserByName(authUsername).getQuestionLikes());
		}
		return "home";
	}
	@RequestMapping(value = "/questions", method = RequestMethod.GET)
	public String getQuestions(Model model) {
		model.addAttribute("questions", questionService.getQuestions());
		model.addAttribute("limitedQuestions", questionService.getQuestions(5));
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!auth.getName().equals("anonymousUser")) {
			String authUsername = auth.getName();
			model.addAttribute("authUserFavorites",
					userService.findUserByName(authUsername).getFavorites());
			model.addAttribute("authUserQuestionLikes", userService
					.findUserByName(authUsername).getQuestionLikes());
		}
		return "questions";
	}
	@RequestMapping(value = "/questions/{id}", method = RequestMethod.GET)
	public String getQuestion(Locale locale, Model model,
			@PathVariable Integer id) {
		model.addAttribute("question", questionService.getQuestion(id));
		model.addAttribute("answers", answerService.getAnswers(id));
		model.addAttribute("answerAttribute", new Answer());
		model.addAttribute("limitedQuestions", questionService.getQuestions(5));
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!auth.getName().equals("anonymousUser")) {
			String authUsername = auth.getName();
			model.addAttribute("authUserFavorites",
					userService.findUserByName(authUsername).getFavorites());
			model.addAttribute("authUserQuestionLikes", userService
					.findUserByName(authUsername).getQuestionLikes());
			model.addAttribute("authUserAnswerLikes", userService
					.findUserByName(authUsername).getAnswerLikes());
		}
		return "question";
	}
	@RequestMapping(value = "/questions/add", method = RequestMethod.GET)
	public String getAdd(Model model) {
		model.addAttribute("questionAttribute", new Question());
		model.addAttribute("limitedQuestions", questionService.getQuestions(5));
		return "add-question";
	}
	@RequestMapping(value = "/questions/add", method = RequestMethod.POST)
	public String postAdd(@ModelAttribute("questionAttribute") Question question) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		questionService.add(authUsername, question);
		return "redirect:/questions";
	}
	@RequestMapping(value = "/questions/edit", method = RequestMethod.GET)
	public String getEdit(@RequestParam("id") Integer questionId, Model model) {
		Question existingQuestion = questionService.getQuestion(questionId);
		model.addAttribute("questionAttribute", existingQuestion);
		model.addAttribute("limitedQuestions", questionService.getQuestions(5));// deleted

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		if ((!authUsername.equals(questionService.getQuestion(questionId)
				.getUser().getUsername()))
				&& !userService.findUserByName(authUsername).getUsername()
						.equalsIgnoreCase("admin")) {
			model.addAttribute("questionAttribute", new Question());
			return "add-question";
		}
		return "add-question";
	}
	@RequestMapping(value = "/questions/edit", method = RequestMethod.POST)
	public String postEdit(@RequestParam("id") Integer questionId,
			@ModelAttribute("questionAttribute") Question question) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		if ((!authUsername.equals(questionService.getQuestion(questionId)
				.getUser().getUsername()))
				&& !userService.findUserByName(authUsername).getUsername()
						.equalsIgnoreCase("admin")) {
			return "redirect:/questions";
		}
		questionService.edit(question);
		return "redirect:/questions";
	}
	@RequestMapping(value = "/questions/delete", method = RequestMethod.GET)
	public String getDeleteQ(@RequestParam("id") Integer questionId) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		Question existingQuestion = questionService.getQuestion(questionId);
		if (!authUsername.equals(existingQuestion.getUser().getUsername())
				&& !userService.findUserByName(authUsername).getUsername()
						.equalsIgnoreCase("admin")) {
			return "redirect:/questions/";
		}
		answerService.deleteAll(questionId);
		questionService.delete(questionId);
		return "redirect:/questions/";
	}
	@RequestMapping(value = "/favorite", method = RequestMethod.POST)
	@ResponseBody
	public String postAddFavorite(@RequestParam("qid") Integer questionId) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();

		Favorite favorite = new Favorite();
		favorite.setQuestion(questionService.getQuestion(questionId));
		favorite.setUser(userService.findUserByName(authUsername));

		int countExist = 0;
		for (Favorite fav : userService.findUserByName(authUsername)
				.getFavorites()) {
			if (favorite.getQuestion().equals(fav.getQuestion())
					&& favorite.getUser().equals(fav.getUser())) {
				countExist++;
			}
		}
		if (countExist != 0) {
			favoriteService.deleteFavotite(questionId, authUsername);
		} else {
			favoriteService.addFavorite(favorite);
		}
		Integer num = questionService.getQuestion(questionId).getFavorites()
				.size();
		return num.toString();
	}
	@RequestMapping(value = "/question_like", method = RequestMethod.POST)
	@ResponseBody
	public String postAddQuestionLike(@RequestParam("qid") Integer questionId) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String authUsername = auth.getName();
		User authUser = userService.findUserByName(authUsername);

		QuestionLike questionLike = new QuestionLike();
		questionLike.setQuestion(questionService.getQuestion(questionId));
		questionLike.setUser(authUser);

		int countExist = 0;
		for (QuestionLike ql : authUser.getQuestionLikes()) {
			if (questionLike.getQuestion().equals(ql.getQuestion())
					&& questionLike.getUser().equals(ql.getUser())) {
				countExist++;
			}
		}
		if (countExist != 0) {
			questionLikeService.deleteQuestionLike(
					questionService.getQuestion(questionId), authUser);
		} else {
			questionLikeService.addQuestionLike(questionLike);
		}
		Integer num = questionService.getQuestion(questionId)
				.getQuestionLikes().size();

		return num.toString();
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, @RequestParam("q") String text) {
		model.addAttribute("questions", searchService.searchQuestion(text));
		return "search";
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "about";
	}
}