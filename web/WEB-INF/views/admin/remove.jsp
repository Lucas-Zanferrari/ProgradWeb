<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Remoção de Alunos</title>
</head>
<body>
<jsp:include page="cabecalho.jsp"/>
<h2>Remoção de Alunos:</h2>
<form action="/admin/removeAluno" method="post">
    ID: <input type="text" name="id" />
    <br /><br />
    <input type="submit" value="Remover" />
</form>
<jsp:include page="rodape.jsp"/>
</body>
</html>