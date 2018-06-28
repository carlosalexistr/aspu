package co.edu.ufps.aspu.dao;

import java.util.List;

import co.edu.ufps.aspu.entity.Publicacion;

public interface PublicacionDAO {
	public List<Publicacion> findAll();
	public List<Publicacion> findAll(int limit);
	public Publicacion findById(int id);
	public List<Publicacion> findByTituloOrDescripcion(String palabra);
	public Publicacion save(Publicacion publicacion);
	public boolean update(Publicacion publicacion);
	public void close();
}
