package co.edu.ufps.aspu.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import co.edu.ufps.aspu.dao.PublicacionDAO;
import co.edu.ufps.aspu.entity.Publicacion;

public class JpaPublicacionDAOImpl implements PublicacionDAO {
	
	private final EntityManager em;
	
	public JpaPublicacionDAOImpl(EntityManager manager) {
		this.em=manager;
	}
	
	private TypedQuery<Publicacion>generateQueryFindAll(){
		String sql ="SELECT p FROM Publicacion p ORDER BY p.fecha DESC";
		TypedQuery<Publicacion> query = this.em.createQuery(sql,Publicacion.class);
		return query;
	}
	
	@Override
	public List<Publicacion> findAll() {	
		TypedQuery<Publicacion> query = this.generateQueryFindAll();
		return query.getResultList();
	}
	@Override
	public List<Publicacion> findAll(int limit) {
		TypedQuery<Publicacion> query = this.generateQueryFindAll();
		query.setMaxResults(limit);
		return query.getResultList();
	}

	@Override
	public Publicacion save(Publicacion entity) {
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
	public Publicacion findById(int id) {		
		return em.find(Publicacion.class, id);
	}
	
	public List<Publicacion> findByTituloOrDescripcion(String palabra){
		String sql = "SELECT p FROM Publicacion p WHERE p.titulo LIKE :palabra or p.descripcion LIKE :palabra";
		TypedQuery<Publicacion> query = this.em.createQuery(sql,Publicacion.class);
		query.setParameter("palabra", "%"+palabra+"%");
		return query.getResultList();
	}
	
	public void close() {
		this.em.close();
	}

	@Override
	public boolean update(Publicacion entity) {
		boolean estado= true;
		try {
			EntityTransaction transaction = em.getTransaction();
			transaction.begin();
			this.em.merge(entity);
			transaction.commit();
		}catch (Exception e) {
			estado = false;
		}
		return estado;
	}
	

}
