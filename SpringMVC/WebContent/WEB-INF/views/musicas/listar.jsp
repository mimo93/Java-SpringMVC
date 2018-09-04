<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>Listagem de músicas</h2>
<br />
<div class="row">
	<div class="col-md-10">
		<div class="form-group">
			<label>Música a ser pesquisada</label>
			<input type="text" id="txt-pesquisa" class="form-control">
		</div>
		<button class="btn btn-outline-primary" id="btn-pesquisar">Pesquisar</button>
	</div>
</div>
<table class="table" id="tbl-musicas">
	<thead>
		<th>ID</th>
		<th>Nome da música</th>
		<th>Data de criação</th>
		<th>Nome do álbum</th>
		<th>Ações</th>
	</thead>
	<tbody>
		<c:if test="${!empty musicas}">
			<c:forEach items="${musicas}" var="musica">
				<tr>
					<td>${musica.id}</td>
					<td>${musica.nome}</td>
					<td><fmt:formatDate value="${musica.dataCriacao}" pattern="dd/MM/yyyy" timeZone="UTC"/></td>
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
<a href="/SpringMVC/musicas/adicionar" class="btn btn-success">Adicionar nova música</a>

<script type="text/javascript">
	$(document).ready(function(){
		$('#btn-pesquisar').click(function(){
			var nomeMusica = $('#txt-pesquisa').val();
			$.ajax({
				method: 'GET',
				url: '/SpringMVC/musicas/porNome?nome=' + nomeMusica,
				success: function(data){
					$('#tbl-musicas tbody > tr').remove();
					$.each(data, function(index, musica){
						$('#tbl-musicas tbody').append(
								'<tr>' +
								'	<td>' + musica.id + '</td>' +
								'	<td>' + musica.nome + '</td>' +
								'	<td>' + musica.dataCriacao + '</td>' +
								'   <td>' + musica.album.nome + '</td>' +
								'	<td>' + 
								'		<a href="/SpringMVC/musicas/alterar/' + musica.id + '" class="btn btn-primary">Alterar</a>' +
								'		<a href="/SpringMVC/musicas/excluir/' + musica.id + '" class="btn btn-danger">Excluir</a>' +
								'   </td>' +
								'</tr>'
						);
					})
				},
				error: function(){
					alert("Houve um erro na requisição.");
				}
			});
		});
	});
</script>