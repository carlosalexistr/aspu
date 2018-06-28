package co.edu.ufps.aspu.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.ufps.aspu.service.UsuarioService;
import co.edu.ufps.aspu.util.Answer;

/**
 * Servlet implementation class CambiarPassword
 */
@WebServlet("/cambiarPassword")
public class CambiarPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuarioService usuarioService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiarPassword() {
        super();       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/password.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String passwordOld = request.getParameter("passwordOld");
		String passwordNew = request.getParameter("passwordNew");
		int idUsuario =(int) request.getSession().getAttribute("usuarioId");
		usuarioService = new UsuarioService();
		Answer<String> ret= usuarioService.cambiarContraseña(idUsuario, passwordOld, passwordNew);
		request.setAttribute("ret", ret);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/password.jsp");
		rd.forward(request, response);
		
	}

}
