package co.edu.ufps.aspu.service;

import java.util.Date;
import java.util.List;

import co.edu.ufps.aspu.dao.CategoriaDAO;
import co.edu.ufps.aspu.dao.ComentarioDAO;
import co.edu.ufps.aspu.dao.PublicacionDAO;
import co.edu.ufps.aspu.dao.UsuarioDAO;
import co.edu.ufps.aspu.entity.Categoria;
import co.edu.ufps.aspu.entity.Comentario;
import co.edu.ufps.aspu.entity.Publicacion;
import co.edu.ufps.aspu.entity.Usuario;
import co.edu.ufps.aspu.factory.DAOFactory;
import co.edu.ufps.aspu.util.Answer;

public class NoticiaService {
	
	private DAOFactory factory;
	
	public NoticiaService() {
		this.factory= DAOFactory.getDAOFactory(DAOFactory.JPA);
	}
	
	public List<Publicacion> listarNoticias() {
		PublicacionDAO publicacionDao = factory.getPublicacion();
		List<Publicacion> list =publicacionDao.findAll();
		publicacionDao.close();
		return list;
	}
	
	public List<Publicacion> listarNoticiasLimit(){
		PublicacionDAO publicacionDao = factory.getPublicacion();
		List<Publicacion> list =publicacionDao.findAll(4);
		publicacionDao.close();
		return list; 
		
	}
	
	public Publicacion buscar(int id) {
		PublicacionDAO publicacionDao = factory.getPublicacion();
		Publicacion publc =publicacionDao.findById(id);	
		publicacionDao.close();
		return publc;	
	}
	
	public Answer<String> comentar(int idUsuario,int idPublicacion,String contenido) {
		Comentario coment = new Comentario();
		coment.setContenido(contenido);
		coment.setFecha(new Date());
		
		PublicacionDAO publicacionDao = factory.getPublicacion();
		Publicacion publicacion =publicacionDao.findById(idPublicacion);
		coment.setPublicacion(publicacion);
		
		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		Usuario usuario =usuarioDao.findById(idUsuario);
		coment.setUsuario(usuario);
		
		ComentarioDAO comentarioDao = factory.getComentarioDAO();
		if(comentarioDao.save(coment)!=null) {
			return new Answer<String>(true,"Registro exitoso");
		}		
		return new Answer<String>(false,"Registro fallido");
	}
	
	public List<Categoria> listarCategorias(){
		CategoriaDAO categoriaDao = factory.getCategoria();
		return categoriaDao.findAll();
	}
	
	public Answer<Publicacion> registrar(int categoriaId, int usuarioId,String titulo, String contenido,String descripcion,String palabras){
		Publicacion noticia = new Publicacion();
		noticia.setTitulo(titulo);
		noticia.setDescripcion(descripcion);
		noticia.setPalabrasClave(palabras);
		noticia.setContenido(contenido);
		noticia.setFecha(new Date());
		
		CategoriaDAO categoriaDao = factory.getCategoria();
		Categoria categoria = categoriaDao.findById(categoriaId);
		noticia.setCategoria(categoria);
		
		UsuarioDAO usuarioDao = factory.getUsuarioDAO();
		Usuario usuario = usuarioDao.findById(usuarioId);
		noticia.setUsuario(usuario);
		
		PublicacionDAO publicacionDao = factory.getPublicacion();
		if(publicacionDao.save(noticia)!=null) {
			return new Answer<Publicacion>(true,noticia);
		}
		
		return new Answer<Publicacion>(false,noticia);
	}
	
	public Answer<String> actualizar(int idNoticia,int idCategoria,String titulo,String descripcion,String palabras, String contenido){
		PublicacionDAO publicacionDao = factory.getPublicacion();
		Publicacion noticia =publicacionDao.findById(idNoticia);
		
		noticia.setTitulo(titulo);
		noticia.setDescripcion(descripcion);
		noticia.setPalabrasClave(palabras);
		noticia.setContenido(contenido);
		
		CategoriaDAO categoriaDao = factory.getCategoria();
		Categoria categoria = categoriaDao.findById(idCategoria);
		noticia.setCategoria(categoria);
		boolean estado = publicacionDao.update(noticia);
		if(estado) {
			return new Answer<String>(true,"Actualizacion exitosa");
		}
		return new Answer<String>(false,"Actualizacion fallida");
	}
	
	public List<Publicacion> filtrarNoticia(String palabra){
		PublicacionDAO publicacionDao = factory.getPublicacion();
		List<Publicacion> listado = publicacionDao.findByTituloOrDescripcion(palabra);
		publicacionDao.close();
		return listado;
	}
	
	
	
}
