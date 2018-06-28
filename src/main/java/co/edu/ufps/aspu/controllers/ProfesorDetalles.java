package co.edu.ufps.aspu.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.ufps.aspu.entity.Usuario;
import co.edu.ufps.aspu.service.ProfesorService;

/**
 * Servlet implementation class ProfesorDetalles
 */
@WebServlet("/profesor")
public class ProfesorDetalles extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProfesorService profesorService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfesorDetalles() {
        super();
        this.profesorService = new ProfesorService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/profesor_detalles.jsp");
		
		Usuario usuario =this.profesorService.buscar(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("profesor", usuario);
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
