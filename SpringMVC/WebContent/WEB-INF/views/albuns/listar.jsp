<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>Listagem de álbuns</h2>
<br />
<div class="row">
	<div class="col-md-10">
		<div class="form-group">
			<label>Álbum a ser pesquisado</label>
			<input type="text" id="txt-pesquisa" class="form-control">
		</div>
		<button class="btn btn-outline-primary" id="btn-pesquisar">Pesquisar</button>
	</div>
</div>
<table class="table" id="tbl-albuns">
	<thead>
		<th>ID</th>
		<th>Nome do álbum</th>
		<th>Ano do lançamento</th>
		<th>Ações</th>
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
<a href="/SpringMVC/albuns/adicionar" class="btn btn-success">Adicionar novo álbum</a>

<script type="text/javascript">
	$(document).ready(function(){
		$('#btn-pesquisar').click(function(){
			var nomeAlbum = $('#txt-pesquisa').val();
			$.ajax({
				method: 'GET',
				url: '/SpringMVC/albuns/porNome?nome=' + nomeAlbum,
				success: function(data){
					$('#tbl-albuns tbody > tr').remove();
					$.each(data, function(index, album){
						$('#tbl-albuns tbody').append(
								'<tr>' +
								'	<td>' + album.id + '</td>' +
								'	<td>' + album.nome + '</td>' +
								'	<td>' + album.anoLancamento + '</td>' +
								'	<td>' + 
								'		<a href="/SpringMVC/albuns/alterar/' + album.id + '" class="btn btn-primary">Alterar</a>' +
								'		<a href="/SpringMVC/albuns/excluir/' + album.id + '" class="btn btn-danger">Excluir</a>' +
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