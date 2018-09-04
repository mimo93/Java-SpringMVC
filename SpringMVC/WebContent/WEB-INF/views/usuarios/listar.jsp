<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>Listagem de usu�rios</h2>
<br />
<!-- div class="row">
	<div class="col-md-10">
		<div class="form-group">
			<label>Usu a ser pesquisada</label>
			<input type="text" id="txt-pesquisa" class="form-control">
		</div>
		<button class="btn btn-outline-primary" id="btn-pesquisar">Pesquisar</button>
	</div>
</div-->
<table class="table" id="tbl-musicas">
	<thead>
		<th>ID</th>
		<th>Nome de usu�rio</th>
		<th>Role</th>
	</thead>
	<tbody>
		<c:if test="${!empty usuarios}">
			<c:forEach items="${usuarios}" var="usuario">
				<tr>
					<td>${usuario.id}</td>
					<td>${usuario.username}</td>
					<td>${usuario.role}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br />
<a href="/SpringMVC/usuarios/adicionar" class="btn btn-success">Adicionar novo usu�rio</a>