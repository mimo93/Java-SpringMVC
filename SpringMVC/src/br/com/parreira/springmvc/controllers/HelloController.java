package br.com.parreira.springmvc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hello")
public class HelloController {
	
	@RequestMapping("/message")
	public String message() {
		return "hello";
	}
	
	@RequestMapping("/mensagemDoServidor")
	public String mensagemDoServidor(Model model) {
		model.addAttribute("mensagem", "Ol�, Cleverson!");
		return "mensagemDoServidor";
	}

}
