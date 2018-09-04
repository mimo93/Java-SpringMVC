package br.com.parreira.springmvc.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.parreira.springmvc.dominios.Usuario;

public interface RepositorioUsuario extends JpaRepository<Usuario, Long> {
	
	Usuario findByUsername(String username);	
	
}
