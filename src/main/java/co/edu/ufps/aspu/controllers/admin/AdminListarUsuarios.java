package co.edu.ufps.aspu.controllers.admin;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ListarUsuariosServlet
 */
@WebServlet("/usuarios")
public class AdminListarUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuarioService usuarioService;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminListarUsuarios() {
        super();
        usuarioService= new UsuarioService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("rol")==null) {	
			response.sendRedirect("login");
			return;
		}else if(!session.getAttribute("rol").equals("admin")) {
			response.sendRedirect("inicio");
			return;
		}
		
		List<Usuario> listado =this.usuarioService.listarUsuarios();
        request.setAttribute("usuarios",listado);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_usuarios.jsp");
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
