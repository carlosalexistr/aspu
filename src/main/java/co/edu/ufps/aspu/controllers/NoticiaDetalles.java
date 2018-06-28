package co.edu.ufps.aspu.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.ufps.aspu.entity.Publicacion;
import co.edu.ufps.aspu.service.NoticiaService;

/**
 * Servlet implementation class NoticiaDetalles
 */
@WebServlet("/noticia")
public class NoticiaDetalles extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticiaService noticiaService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticiaDetalles() {
        super();
        this.noticiaService=new NoticiaService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/noticia_detalles.jsp");
		Publicacion publicacion =noticiaService.buscar(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("noticia", publicacion);
		 rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
