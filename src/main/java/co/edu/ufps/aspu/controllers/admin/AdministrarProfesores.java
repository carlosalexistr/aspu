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
import co.edu.ufps.aspu.service.ProfesorService;

/**
 * Servlet implementation class AdministrarProfesores
 */
@WebServlet("/listarProfesores")
public class AdministrarProfesores extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfesorService profesorService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministrarProfesores() {
        super();
        this.profesorService= new ProfesorService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession();
		if(session.getAttribute("rol")==null) {	
			response.sendRedirect("login");
			return;
		}else if(!session.getAttribute("rol").equals("admin")) {
			response.sendRedirect("inicio");
			return;
		}
		
        List<Usuario> listado =this.profesorService.listarProfesores();
        request.setAttribute("profesores",listado);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_profesores.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}
