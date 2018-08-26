<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>Listagem de m�sicas</h2>
<br />
<table class="table">
	<thead>
		<th>ID</th>
		<th>Nome da m�sica</th>
		<th>Data de cria��o</th>
		<th>Nom do �lbum</th>
		<th>A��es</th>
	</thead>
	<tbody>
		<c:if test="${!empty musicas}">
			<c:forEach items="${musicas}" var="musica">
				<tr>
					<td>${musica.id}</td>
					<td>${musica.nome}</td>
					<td>${musica.dataCriacao}</td>
					<td>${musica.album.nome}</td>
					<td>
						<a href="/SpringMVC/musicas/alterar/${musica.id}" class="btn btn-primary">Alterar</a> 
						<a href="/SpringMVC/musicas/excluir/${musica.id}" class="btn btn-danger">Excluir</a> 
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br />
<a href="/SpringMVC/musicas/adicionar" class="btn btn-success">Adicionar nova m�sica</a>