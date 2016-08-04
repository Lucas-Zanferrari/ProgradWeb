package br.edu.ufabc.progradwebspring.controller;

/**
 * Created by lucaszanferrari on 7/31/16.
 */

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import br.edu.ufabc.progradwebspring.dao.AlunoDAO;
import br.edu.ufabc.progradwebspring.model.Aluno;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
public class AlunoController {
    @RequestMapping(value = "/admin/insere", method = RequestMethod.GET)
    public String insere() {
        return "admin/insere";
    }

    @RequestMapping(value = "/admin/insereAluno", method = RequestMethod.POST)
    public String insereAluno(Aluno aluno, Model model) {
        AlunoDAO dao = new AlunoDAO();
        dao.insere(aluno);
        model.addAttribute("mensagem", "Aluno: " + aluno.getNome() + " inserido com sucesso!");
        return "admin/sucesso";
    }

    @RequestMapping(value = "/admin/busca", method = RequestMethod.GET)
    public String busca() {
        return "admin/busca";
    }

    @RequestMapping(value = "/admin/listaAlunos", method = RequestMethod.POST)
    public String listaAlunos(@RequestParam(defaultValue = "todos") String opcaoBusca, @RequestParam("nomeBusca") String nomeBusca, Model model) {
        AlunoDAO dao = new AlunoDAO();
        List<Aluno> lista;
        if (opcaoBusca.equals("todos")) {
            lista = dao.getLista();
        } else {
            lista = dao.buscaAlunoPeloNome(nomeBusca);
        }
        model.addAttribute("listaAlunos", lista);

        return "admin/listaAlunos";
    }


    @RequestMapping(value = "/admin/altera", method = RequestMethod.GET)
    public String altera() {
        return "admin/altera";
    }

    @RequestMapping(value="/admin/alteraAluno", method=RequestMethod.POST)
    public String alteraAluno(Aluno aluno, Model model) {
        AlunoDAO dao = new AlunoDAO();
        dao.altera(aluno);
        model.addAttribute("mensagem", "Aluno: " + aluno.getId() + " alterado com sucesso!");

        return listaAlunos("todos", null, model);
    }

    @RequestMapping(value="/admin/remove", method=RequestMethod.GET)
    public String remove() {
        return "admin/remove";
    }

    @RequestMapping(value="/admin/removeAluno", method=RequestMethod.POST)
    public String removeAluno(@RequestParam("id") long id, Model model) {
        AlunoDAO dao = new AlunoDAO();
        Aluno aluno = new Aluno();
        aluno.setId(id);
        dao.remove(aluno);
        model.addAttribute("mensagem", "Aluno: " + aluno.getId() + " removido com sucesso!");

        return listaAlunos("todos", null, model);
    }
}