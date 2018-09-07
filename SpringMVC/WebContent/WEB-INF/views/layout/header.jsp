<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#">SpringMVC</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Álbuns </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="/SpringMVC/albuns/listar">Listar</a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="dropdown-item" href="/SpringMVC/albuns/adicionar">Adicionar</a>
						</sec:authorize>
					</div></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Músicas </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="/SpringMVC/musicas/listar">Listar</a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="dropdown-item" href="/SpringMVC/musicas/adicionar">Adicionar</a>
						</sec:authorize>
					</div></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Usuários </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="/SpringMVC/usuarios/listar">Listar</a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="dropdown-item" href="/SpringMVC/usuarios/adicionar">Adicionar</a>
						</sec:authorize>
					</div></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Bem-vindo,
						${principal.username} </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="/SpringMVC/logout">Sair</a>
					</div></li>
			</ul>
		</div>
	</sec:authorize>
</nav>