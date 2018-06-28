/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.aspu.dao;

import co.edu.ufps.aspu.entity.Usuario;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Carlos
 */
public interface UsuarioDAO  {
    public List<Usuario> findByTipoUsuario(String tipoUsuario);
    public List<Usuario>findTipoUsuario(String tipoUsuario,int limite);
    public Usuario save(Usuario entity);
    public boolean update(Usuario entity);
    public Usuario findById(int id);
    public Usuario findByEmail(String email);
    public List<Usuario> findByNombreOrApellido(String tipoUsuario,String palabra);
    public void close();
}
