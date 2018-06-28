package co.edu.ufps.aspu.factory;

import javax.persistence.EntityManagerFactory;

import co.edu.ufps.aspu.dao.CategoriaDAO;
import co.edu.ufps.aspu.dao.ComentarioDAO;
import co.edu.ufps.aspu.dao.PublicacionDAO;
import co.edu.ufps.aspu.dao.UsuarioDAO;
import co.edu.ufps.aspu.dao.impl.JpaCategoriaDAOImpl;
import co.edu.ufps.aspu.dao.impl.JpaComentarioDAOImpl;
import co.edu.ufps.aspu.dao.impl.JpaPublicacionDAOImpl;
import co.edu.ufps.aspu.dao.impl.JpaUsuarioDAOImpl;

public class JpaDAOFactory extends DAOFactory {
	
	private final EntityManagerFactory factory;
	
	public JpaDAOFactory() {
		this.factory = PersistenceManager.getInstance().getEntityManagerFactory();
	}

	@Override
	public ComentarioDAO getComentarioDAO() {
		return new JpaComentarioDAOImpl(factory.createEntityManager());
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		return new JpaUsuarioDAOImpl(factory.createEntityManager());
	}

	@Override
	public PublicacionDAO getPublicacion() {		
		return new JpaPublicacionDAOImpl(factory.createEntityManager());
	}

	@Override
	public CategoriaDAO getCategoria() {
		return new JpaCategoriaDAOImpl(factory.createEntityManager());
	}

}
