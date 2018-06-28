package co.edu.ufps.aspu.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.ufps.aspu.entity.Publicacion;
import co.edu.ufps.aspu.service.NoticiaService;

/**
 * Servlet implementation class ListarNoticias
 */
@WebServlet("/noticias")
public class ListarNoticias extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private NoticiaService noticiaService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarNoticias() {
        super();
        this.noticiaService = new NoticiaService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Publicacion> listado= noticiaService.listarNoticias();
		request.setAttribute("noticias",listado);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/noticias.jsp");
        rd.forward(request, response);
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String palabra =request.getParameter("palabra");
		List<Publicacion> listado = noticiaService.filtrarNoticia(palabra);
		request.setAttribute("noticias",listado);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/noticias.jsp");
        rd.forward(request, response);
	}

}
