<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Busca de Alunos</title>
</head>
<body>
<jsp:include page="cabecalho.jsp"/>
<h2>Busca de Alunos:</h2>
<form action="/admin/listaAlunos" method="post">
    <input type="radio" name="opcaoBusca" value="todos" checked="checked">Todos
    <br>
    <input type="radio" name="opcaoBusca" value="nome">Nome do aluno:
    <input type="text" name="nomeBusca" />
    <br>
    <br>
    <input type="submit" value="Buscar" />
</form>
<jsp:include page="rodape.jsp"/>
</body>
</html>