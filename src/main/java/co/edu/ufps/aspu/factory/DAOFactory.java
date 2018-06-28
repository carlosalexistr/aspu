package co.edu.ufps.aspu.factory;

import co.edu.ufps.aspu.dao.CategoriaDAO;
import co.edu.ufps.aspu.dao.ComentarioDAO;
import co.edu.ufps.aspu.dao.PublicacionDAO;
import co.edu.ufps.aspu.dao.UsuarioDAO;

public abstract class DAOFactory {
	public static final int JPA = 1;
	public static final int ORACLE = 2;
	public static final int SYBASE = 3;

	public abstract ComentarioDAO getComentarioDAO();
	public abstract UsuarioDAO getUsuarioDAO();
	public abstract PublicacionDAO getPublicacion();
	public abstract CategoriaDAO getCategoria();

	public static DAOFactory getDAOFactory(int whichFactory) {

		switch (whichFactory) {
		case JPA:
			return new JpaDAOFactory();
		case ORACLE:
			return null;
		case SYBASE:
			return null;
		default:
			return null;
		}
	}
}
