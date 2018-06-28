package co.edu.ufps.aspu.dao;

import java.util.List;

import co.edu.ufps.aspu.entity.Categoria;

public interface CategoriaDAO {
	public List<Categoria> findAll();
	public Categoria findById(int id);
	public void close();
}
