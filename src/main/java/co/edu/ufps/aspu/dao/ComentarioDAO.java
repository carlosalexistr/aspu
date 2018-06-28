/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.aspu.dao;

import java.util.List;

import co.edu.ufps.aspu.entity.Comentario;

/**
 *
 * @author Carlos
 */
public interface ComentarioDAO {

    public Comentario save(Comentario entity);
    public List<Comentario> findByPublicacion(int id);
    public void close();

    //public void update(T entity);

   

    //public void delete(T entity);

    //public List<T> findAll();

    //public void deleteAll();

}
