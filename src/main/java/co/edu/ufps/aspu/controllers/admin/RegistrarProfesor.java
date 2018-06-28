package co.edu.ufps.aspu.controllers.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.ufps.aspu.service.ProfesorService;
import co.edu.ufps.aspu.util.Answer;

/**
 * Servlet implementation class RegistrarProfesor
 */
@WebServlet("/registrarProfesor")
public class RegistrarProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProfesorService profesorService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarProfesor() {
        super();
        this.profesorService= new ProfesorService();
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
		 request.setAttribute("action_url", "registrarProfesor");
		 String[] generos = {"maculino","femenino","otro"};
		 request.setAttribute("generos", generos);
		 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_registrar_profesor.jsp");
	     rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom =request.getParameter("nombres");
		String ape=request.getParameter("apellidos");
		String esp=request.getParameter("especializacion");
		String gen=request.getParameter("genero");
		String fech =request.getParameter("fecha_nacimiento");
		String email=request.getParameter("email");
		String tel=request.getParameter("telefono");
		Answer<String> ret =this.profesorService.registrar(nom, ape, gen, esp, fech, email, tel);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_registrar_profesor.jsp");
		request.setAttribute("ret", ret);
		request.setAttribute("action_url", "registrarProfesor");
        rd.forward(request, response);
	}

}
