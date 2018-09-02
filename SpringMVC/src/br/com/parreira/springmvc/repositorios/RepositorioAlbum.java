package br.com.parreira.springmvc.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.parreira.springmvc.dominios.Album;

public interface RepositorioAlbum extends JpaRepository<Album, Long> {

	@Query("SELECt a FROM Album a WHERE a.nome LIKE %:nome%")
	List<Album> findByNome(@Param("nome") String nome);
	
}