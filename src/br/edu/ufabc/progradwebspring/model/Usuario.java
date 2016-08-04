package br.edu.ufabc.progradwebspring.model;

/**
 * Created by lucaszanferrari on 7/28/16.
 */
public class Usuario {
    private String usuario;
    private String senha;

    public void setUsuario(String usuario){
        this.usuario = usuario;
    }
    public String getUsuario(){
        return this.usuario;
    }
    public void setSenha(String senha){
        this.senha = senha;
    }
    public String getSenha(){
        return this.senha;
    }
}
