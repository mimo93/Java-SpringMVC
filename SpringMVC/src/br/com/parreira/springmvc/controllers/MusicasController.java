package br.com.parreira.springmvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.parreira.springmvc.repositorios.RepositorioAlbum;
import br.com.parreira.springmvc.repositorios.RepositorioMusica;

@Controller
@RequestMapping("/musicas")
public class MusicasController {

	@Autowired
	private RepositorioAlbum repositorioAlbum;
	@Autowired
	private RepositorioMusica repositorioMusica;
	
}
