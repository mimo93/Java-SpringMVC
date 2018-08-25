package br.com.parreira.springmvc.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.parreira.springmvc.dominios.Album;

public interface RepositorioAlbum extends JpaRepository<Album, Long> {

}