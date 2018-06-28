package co.edu.ufps.aspu.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import co.edu.ufps.aspu.dao.UsuarioDAO;
import co.edu.ufps.aspu.entity.Usuario;

public class JpaUsuarioDAOImpl implements UsuarioDAO {

	private final EntityManager em;

	public JpaUsuarioDAOImpl(EntityManager manager) {
		this.em = manager;
	}

	@Override
	public List<Usuario> findByTipoUsuario(String tipoUsuario) {
		TypedQuery<Usuario> query = this.generateQueryFindByTipoUsuario(tipoUsuario);
		return query.getResultList();
	}

	@Override
	public List<Usuario> findTipoUsuario(String tipoUsuario, int limite) {
		TypedQuery<Usuario> query = this.generateQueryFindByTipoUsuario(tipoUsuario);
		query.setMaxResults(limite);
		return query.getResultList();
	}

	private TypedQuery<Usuario> generateQueryFindByTipoUsuario(String tipoUsuario) {
		String sql = "SELECT u FROM Usuario u WHERE u.tipoUsuario = :tipoUsuario ORDER BY u.fechaRegistro DESC";
		TypedQuery<Usuario> query = this.em.createQuery(sql, Usuario.class);
		query.setParameter("tipoUsuario", tipoUsuario);
		return query;
	}

	@Override
	public Usuario save(Usuario entity) {

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
	public boolean update(Usuario entity) {
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

	@Override
	public Usuario findById(int id) {
		return em.find(Usuario.class, id);
	}

	@Override
	public Usuario findByEmail(String email) {
		String sql = "SELECT u FROM Usuario u WHERE u.email = :email  and (u.tipoUsuario = :usuario or u.tipoUsuario = :admin)";
		TypedQuery<Usuario> query = this.em.createQuery(sql, Usuario.class);
		query.setParameter("email", email);
		query.setParameter("usuario", "usuario");
		query.setParameter("admin", "admin");
		List<Usuario> listado = query.getResultList();
		Usuario user = null;
		if (!listado.isEmpty()) {
			user = listado.get(0);
		}
		return user;
	}
	
	public void close() {
		this.em.close();
	}
	
	public List<Usuario> findByNombreOrApellido(String tipoUsuario, String palabra){
		String sql = "SELECT u FROM Usuario u WHERE u.tipoUsuario = :tipoUsuario and (u.nombres LIKE :palabra or u.apellidos LIKE :palabra)";
		TypedQuery<Usuario> query = this.em.createQuery(sql, Usuario.class);
		query.setParameter("tipoUsuario", tipoUsuario);
		query.setParameter("palabra", "%"+palabra+"%");
		return query.getResultList();
	}

}
