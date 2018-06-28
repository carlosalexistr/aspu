package co.edu.ufps.aspu.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import co.edu.ufps.aspu.dao.UsuarioDAO;
import co.edu.ufps.aspu.entity.Usuario;
import co.edu.ufps.aspu.factory.DAOFactory;
import co.edu.ufps.aspu.util.Answer;

public class ProfesorService {

	private DAOFactory factory;

	public ProfesorService() {
		this.factory = DAOFactory.getDAOFactory(DAOFactory.JPA);
	}
	
	public List<Usuario> listarProfesores(){
		UsuarioDAO usuarioDao= factory.getUsuarioDAO();
		List<Usuario> list =usuarioDao.findByTipoUsuario("profesor");
		usuarioDao.close();
		return list;
	}
	public List<Usuario> ListarProfesoresLimit(){
		UsuarioDAO usuarioDao= factory.getUsuarioDAO();
		List<Usuario>list =usuarioDao.findTipoUsuario("profesor", 4);
		usuarioDao.close();
		return list;
		
	}
	
	public Usuario buscar(int id) {
		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		Usuario  prof =usuarioDao.findById(id);
		usuarioDao.close();
		return prof;
	}
	
	public List<Usuario> filtrarProfesor(String palabra) {
		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		List<Usuario> listado = usuarioDao.findByNombreOrApellido("profesor", palabra);
		usuarioDao.close();
		return listado;
	}
	
	public Answer<String>registrar(String nombres, String apellidos,String genero,String espec,String fecha,String email, String tel){
		UsuarioDAO usuarioDao= factory.getUsuarioDAO();
		if(usuarioDao.findByEmail(email)!=null) {
			return new Answer<String>(false,"Email ya existe");
		}
		Usuario profesor = this.llenarUsuario(new Usuario(),nombres, apellidos, genero, espec, fecha, email, tel);
		profesor.setFechaRegistro(new Date());
		profesor.setEstado("a");
		if(usuarioDao.save(profesor)!=null) {
			return new Answer<String>(true,"Registro exitoso");
		}
		usuarioDao.close();
		return new Answer<String>(false,"Registro fallido");
		
	}
	
	public Answer<Usuario> actualizar(String id,String nombres, String apellidos,String genero,String espec,String fecha,String email, String tel){
		UsuarioDAO usuarioDao= factory.getUsuarioDAO();
		Usuario profe =usuarioDao.findById(Integer.parseInt(id));
		profe =this.llenarUsuario(profe, nombres, apellidos, genero, espec, fecha, email, tel);
		if(usuarioDao.update(profe)) {
			return new Answer<Usuario>(true,profe);
		}
		usuarioDao.close();
		return new Answer<Usuario>(false,profe);
	}
	
	
	private Usuario llenarUsuario(Usuario profesor, String nombres, String apellidos,String genero,String espec,String fecha,String email, String tel) {
		profesor.setNombres(nombres);
		profesor.setApellidos(apellidos);
		profesor.setGenero(genero);
		profesor.setEspecializacion(espec);
		profesor.setEmail(email);
		profesor.setTelefono(tel);
		profesor.setTipoUsuario("profesor");		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			profesor.setFechaNacimiento(formatter.parse(fecha));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return profesor;
	}

}
