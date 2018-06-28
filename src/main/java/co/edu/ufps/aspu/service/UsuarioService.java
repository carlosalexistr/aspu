package co.edu.ufps.aspu.service;

import java.util.List;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_ADDPeer;

import co.edu.ufps.aspu.dao.UsuarioDAO;
import co.edu.ufps.aspu.entity.Usuario;
import co.edu.ufps.aspu.factory.DAOFactory;
import co.edu.ufps.aspu.util.Answer;

public class UsuarioService {
	private DAOFactory factory;

	public UsuarioService() {
		this.factory = DAOFactory.getDAOFactory(DAOFactory.JPA);
	}

	public List<Usuario> listarUsuarios() {
		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		List<Usuario> list = usuarioDao.findByTipoUsuario("usuario");
		usuarioDao.close();
		return list;
	}

	public Usuario validar(String email, String password) {
		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		Usuario usuario = usuarioDao.findByEmail(email);
		usuarioDao.close();
		if (usuario != null && usuario.getPassword().equals(password)) {
			return usuario;
		}	
		return null;
	}

	public Answer<String> registrar(String nombres, String apellidos, String genero, String email, String password) {

		Usuario user = new Usuario();
		user.setNombres(nombres);
		user.setApellidos(apellidos);
		user.setEmail(email);
		user.setPassword(password);
		user.setTipoUsuario("usuario");
		user.setGenero(genero);

		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		if (usuarioDao.save(user) != null) {
			usuarioDao.close();
			return new Answer<String>(true, "Registro exitoso");
		}
		usuarioDao.close();
		return new Answer<String>(false, "registro fallido");
	}
	
	public Answer<String> cambiarContraseña(int id, String passwordOld,String passwordNew){
		
		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		Usuario user =usuarioDao.findById(id);
		System.out.println("{"+passwordOld+"-"+user.getPassword()+"}");
		if(user.getPassword().equals(passwordOld)) {
			user.setPassword(passwordNew);
			if(usuarioDao.update(user)) {
				return new Answer<String>(true,"actualizacion exitosa");
			}else {
				return new Answer<String>(false,"actualizacion fallida");
			}
		}
		usuarioDao.close();
		return new Answer<String>(false,"contraseña incorrecta");
	}

}
