package co.edu.ufps.aspu.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import co.edu.ufps.aspu.dao.CategoriaDAO;
import co.edu.ufps.aspu.entity.Categoria;

public class JpaCategoriaDAOImpl implements CategoriaDAO {
	
	private EntityManager em;
	
	public JpaCategoriaDAOImpl(EntityManager em) {
		this.em=em;
	}

	@Override
	public List<Categoria> findAll() {
		String sql ="SELECT c FROM Categoria c";
		TypedQuery<Categoria> query = this.em.createQuery(sql,Categoria.class);
		return query.getResultList();
	}

	@Override
	public Categoria findById(int id) {
		return this.em.find(Categoria.class, id);
	}

	@Override
	public void close() {
		this.em.close();
		
	}

}
