package co.edu.ufps.aspu.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import co.edu.ufps.aspu.dao.ComentarioDAO;
import co.edu.ufps.aspu.entity.Comentario;

public class JpaComentarioDAOImpl implements ComentarioDAO {
	
	private final EntityManager em;
	
    public JpaComentarioDAOImpl(EntityManager manager) {
		this.em=manager;
	}

	@Override
	public Comentario save(Comentario entity) {
		try {
			EntityTransaction transaction = em.getTransaction();
			transaction.begin();
			this.em.persist(entity);
			transaction.commit();
		}catch (Exception e) {
			entity = null;
		}
		return entity;
	}

	@Override
	public List<Comentario> findByPublicacion(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	public void close() {
		this.em.close();
	}
}
