<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>Listagem de �lbuns</h2>
<br />
<table class="table">
	<thead>
		<th>ID</th>
		<th>Nome do �lbum</th>
		<th>Ano do lan�amento</th>
		<th>A��es</th>
	</thead>
	<tbody>
		<c:if test="${!empty albuns}">
			<c:forEach items="${albuns}" var="album">
				<tr>
					<td>${album.id}</td>
					<td>${album.nome}</td>
					<td>${album.anoLancamento}</td>
					<td>
						<a href="/SpringMVC/albuns/alterar/${album.id}" class="btn btn-primary">Alterar</a> 
						<a href="/SpringMVC/albuns/excluir/${album.id}" class="btn btn-danger">Excluir</a> 
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br />
<a href="/SpringMVC/albuns/adicionar" class="btn btn-success">Adicionar novo �lbum</a>