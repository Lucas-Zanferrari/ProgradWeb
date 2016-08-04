<%--
  Created by IntelliJ IDEA.
  User: lucaszanferrari
  Date: 7/5/16
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Busca de Alunos</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
    <script type="application/javascript">
        function exibeFormulario(){
            document.getElementById('formulario').style.display = "block";
        }

        function copiaDados(id){
            document.getElementById('id').value = id;
            var linhaTabela = document.getElementById('row_'+id);
            var celulas = linhaTabela.getElementsByTagName("td");
            document.getElementById('nome').value = celulas[1].textContent;
            document.getElementById('email').value = celulas[2].textContent.trim();
            document.getElementById('endereco').value = celulas[3].textContent;
        }

        function remover(id) {
            var linhaTabela = document.getElementById('row_' + id);
            var celulas = linhaTabela.getElementsByTagName("td");
            var confirmacao = confirm("Confirma a remoção do aluno " + celulas[1].textContent + " / ID: " + id + "?");
            if (confirmacao == true) {
                document.getElementById('id').value = id;
                document.getElementById('formulario').action = "/admin/removeAluno";
                //document.getElementById('submitButton').click();
                document.getElementById('formulario').submit();
            }
        }

        function validaCampos() {
            var nome = document.getElementById('nome').value;
            var email = document.getElementById('email').value;
            var endereco = document.getElementById('endereco').value;
            if (nome == "" || nome == null || email == "" || email == null || endereco == "" || endereco == null) {
                alert("Todos os campos precisam estar preenchidos!");
                return false;
            }
        }
    </script>
</head>

<body>
<jsp:include page="cabecalho.jsp"/>
<p style="color: green">${requestScope.mensagem}</p>
<h2>Resultado da busca:</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Endereço</th>
        <th>Alterar</th>
        <th>Remover</th>
    </tr>
    <c:forEach var="aluno" items="${listaAlunos}">
        <tr id="row_${aluno.id}">
            <td>${aluno.id}</td>
            <td>${aluno.nome}</td>
            <td>
                <c:if test="${not empty aluno.email}">
                    <a href="mailto:${aluno.email}">${aluno.email}</a>
                </c:if>
            </td>
            <td>${aluno.endereco}</td>
            <td align="center"><input type="radio" name="group1" value="${aluno.id}" onclick="exibeFormulario(); copiaDados(value);" /></td>
            <td align="center"><a href="#" id="${aluno.id}" onclick="remover(id)">Excluir</a></td>
        </tr>
    </c:forEach>
</table>


<br /><br />

<form action="/admin/alteraAluno" method="post" id="formulario" style="display: none" onsubmit="return validaCampos()">
    ID: <input type="text" name="id" id="id" readonly style="color: #AAAAAA" /><br>
    Nome: <input type="text" name="nome" id="nome" /><br>
    Email: <input type="text" name="email" id="email" /><br>
    Endereço: <input type="text" name="endereco" id="endereco" /><br><br>
    <input type="submit" value="Alterar Aluno" id="submitButton" />
</form>

<br />
<a href="${pageContext.request.contextPath}/admin/index">Voltar ao início</a>
<br />
<a href="${pageContext.request.contextPath}/admin/busca">Fazer outra busca</a>
<jsp:include page="rodape.jsp"/>
</body>

</html>
