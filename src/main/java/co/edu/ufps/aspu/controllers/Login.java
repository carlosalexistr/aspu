package co.edu.ufps.aspu.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.ufps.aspu.entity.Usuario;
import co.edu.ufps.aspu.service.UsuarioService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion =request.getSession();
		if(sesion.getAttribute("usuario")==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
	        rd.forward(request, response);
		}else {
			response.sendRedirect("inicio");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuarioP =request.getParameter("email");
		String passwordP=request.getParameter("password");
		
		UsuarioService usuarioService = new UsuarioService();
		Usuario usuario= usuarioService.validar(usuarioP, passwordP);
		if(usuario!=null) {
			HttpSession sesion =request.getSession();
			sesion.setAttribute("usuarioId",usuario.getId());
			sesion.setAttribute("rol",usuario.getTipoUsuario());
			sesion.setAttribute("usuario",usuario.getNombres() +" "+ usuario.getApellidos());
			response.sendRedirect("inicio");
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
			request.setAttribute("mensaje_validacion", "Usuario o Password Incorrectos");
	        rd.forward(request, response);
		}
		
		
	}

}
