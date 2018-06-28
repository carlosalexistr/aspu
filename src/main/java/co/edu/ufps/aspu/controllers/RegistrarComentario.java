package co.edu.ufps.aspu.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import co.edu.ufps.aspu.service.NoticiaService;
import co.edu.ufps.aspu.util.Answer;

/**
 * Servlet implementation class RegistrarComentario
 */
@WebServlet("/registrarComentario")
public class RegistrarComentario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticiaService noticiaService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarComentario() {
        super();
        this.noticiaService = new NoticiaService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	super.doGet(req, resp);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idNoticia");
		System.out.println("id de la publicacion : "+id);
		int idPublicacion = Integer.parseInt(id);
		String contenido =request.getParameter("contenido");
		int idUsuario =(int) request.getSession().getAttribute("usuarioId");
		Answer<String> ret =noticiaService.comentar(idUsuario, idPublicacion, contenido);
		response.setContentType("application/json");
	    //response.setCharacterEncoding("UTF-8");
	    JSONObject obj = new JSONObject();
	    obj.put("estado", ret.isEstado());
	    obj.put("mensaje", ret.getValor());
	    PrintWriter out = response.getWriter();
	    out.print(obj);
	}

}
