<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Alteração de Alunos</title>
</head>
<body>
<jsp:include page="cabecalho.jsp"/>
<h2>Alteração de Alunos:</h2>
<form action="/admin/alteraAluno" method="post">
    ID: <input type="text" name="id" /><br />
    Nome: <input type="text" name="nome" /><br />
    Email: <input type="text" name="email" /><br />
    Endereço: <input type="text" name="endereco" /><br />
    <br />
    <input type="submit" value="Alterar" />
</form>
<jsp:include page="rodape.jsp"/>
</body>
</html>