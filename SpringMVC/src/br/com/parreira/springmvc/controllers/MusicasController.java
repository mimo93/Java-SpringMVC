package br.com.parreira.springmvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.parreira.springmvc.dominios.Musica;
import br.com.parreira.springmvc.repositorios.RepositorioAlbum;
import br.com.parreira.springmvc.repositorios.RepositorioMusica;

@Controller
@RequestMapping("/musicas")
public class MusicasController {

	@Autowired
	private RepositorioAlbum repositorioAlbum;
	@Autowired
	private RepositorioMusica repositorioMusica;
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public String listar(Model model) {
		List<Musica> musicas = repositorioMusica.findAll();
		model.addAttribute("musicas", musicas);
		return "musicas.listar.tiles";
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public String adicionar(Model model) {
		model.addAttribute("musica", new Musica());
		model.addAttribute("albuns", repositorioAlbum.findAll());
		return "musicas.adicionar.tiles";
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("musica") @Valid Musica novaMusica, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("albuns", repositorioAlbum.findAll());
			return "musicas.adicionar.tiles";
		}
		repositorioMusica.save(novaMusica);
		return "redirect:/musicas/listar";
	}
	
	@RequestMapping(value = "/alterar/{id}", method = RequestMethod.GET)
	public String alterar(@PathVariable("id") Long id, Model model) {
		Musica musicaASerAlterada = repositorioMusica.findOne(id);
		model.addAttribute("musica", musicaASerAlterada);
		model.addAttribute("albuns", repositorioAlbum.findAll());
		return "musicas.alterar.tiles";
	}
	
	@RequestMapping(value = "/alterar", method = RequestMethod.POST)
	public String alterar(@ModelAttribute("musica") @Valid Musica musica, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("albuns", repositorioAlbum.findAll());
			return "musicas.alterar.tiles";
		}
		repositorioMusica.save(musica);
		return "redirect:/musicas/listar";
	}
	
	@RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
	public String excluir(@PathVariable("id") Long id) {
		Musica musica = repositorioMusica.findOne(id);
		musica.setAlbum(null);
		repositorioMusica.delete(musica);
		return "redirect:/musicas/listar";
	}
}
