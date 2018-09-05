package br.com.parreira.springmvc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/SpringMVC/home")
public class HomeController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "home.login.tiles";
	}
	
	@RequestMapping(value = "/bemvindo", method = RequestMethod.GET)
	public String bemvindo() {
		return "home.bemvindo.tiles";
	}
	
}
