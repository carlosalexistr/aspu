package co.edu.ufps.aspu.controllers.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.ufps.aspu.entity.Usuario;
import co.edu.ufps.aspu.service.ProfesorService;
import co.edu.ufps.aspu.util.Answer;

/**
 * Servlet implementation class ActualizarProfesor
 */
@WebServlet("/actualizarProfesor")
public class ActualizarProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfesorService profesorService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarProfesor() {
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
		
		String id = request.getParameter("id");
		Usuario profe =profesorService.buscar(Integer.parseInt(id));
		request.setAttribute("profesor",profe);
		String[] generos = {"masculino","femenino","otro"};
		request.setAttribute("generos",generos);
		request.setAttribute("action_url", "actualizarProfesor");
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_registrar_profesor.jsp");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id");
		String nom =request.getParameter("nombres");
		String ape=request.getParameter("apellidos");
		String esp=request.getParameter("especializacion:");
		String gen=request.getParameter("genero");
		String fech =request.getParameter("fecha_nacimiento");
		String email=request.getParameter("email");
		String tel=request.getParameter("telefono");
		Answer<Usuario> ret =profesorService.actualizar(id, nom, ape, gen, esp, fech, email, tel);
		request.setAttribute("profesor", ret.getValor());
		request.setAttribute("action_url", "actualizarProfesor");
		if(ret.isEstado()) {
			request.setAttribute("ret", new Answer<String>(true,"Actualizacion exitosa"));
		}else {
			request.setAttribute("ret", new Answer<String>(true,"Actualizacion fallida"));
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_registrar_profesor.jsp");
        rd.forward(request, response);
	}

}
