<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Inserção de Alunos</title>
    <script type="text/javascript">
        function validaCampos() {
            var nome = document.getElementById('nome').value;
            var email = document.getElementById('email').value;
            var endereco = document.getElementById('endereco').value;
            if (nome == "" || nome == null || email == "" || email == null || endereco == "" || endereco == null)  {
                alert("Todos os campos precisam estar preenchidos!");
                return false;
            }
        }
    </script>
</head>
<body>
<jsp:include page="cabecalho.jsp"/>
<h2>Inserção de Alunos:</h2>
<form action="/admin/insereAluno" method="post">
    Nome: <input type="text" name="nome" id="nome" /><br>
    Email: <input type="text" name="email" id="email" /><br>
    Endereço: <input type="text" name="endereco" id="endereco" /><br><br>
    <input type="submit" value="Gravar" onclick="return validaCampos()" />
</form>
<jsp:include page="rodape.jsp"/>
</body>
</html>