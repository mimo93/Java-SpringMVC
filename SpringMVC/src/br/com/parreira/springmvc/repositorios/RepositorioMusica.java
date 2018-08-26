package br.com.parreira.springmvc.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.parreira.springmvc.dominios.Musica;

public interface RepositorioMusica extends JpaRepository<Musica, Long> {

}
