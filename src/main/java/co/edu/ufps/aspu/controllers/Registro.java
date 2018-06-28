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
 * Servlet implementation class Registro
 */
@WebServlet("/registro")
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioService usuarioService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registro() {
        super();
        usuarioService = new UsuarioService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/registro.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombres =request.getParameter("nombres");
		String apellidos =request.getParameter("apellidos");
		String genero =request.getParameter("genero");
		String email =request.getParameter("email");
		String password = request.getParameter("password");		
		Answer<String> ret =usuarioService.registrar(nombres, apellidos, genero ,email, password);
		request.setAttribute("ret", ret);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/registro.jsp");
		rd.forward(request, response);
		
	}

}
