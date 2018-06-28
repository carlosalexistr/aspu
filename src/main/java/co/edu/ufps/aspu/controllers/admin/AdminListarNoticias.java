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

import co.edu.ufps.aspu.entity.Publicacion;
import co.edu.ufps.aspu.service.NoticiaService;

/**
 * Servlet implementation class AdminListarNoticias
 */
@WebServlet("/listarNoticias")
public class AdminListarNoticias extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticiaService noticiaService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminListarNoticias() {
        super();
        this.noticiaService = new NoticiaService();
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
		
		List<Publicacion> listado= noticiaService.listarNoticias();
		request.setAttribute("noticias",listado);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_noticias.jsp");
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
