package co.edu.ufps.aspu.controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import co.edu.ufps.aspu.entity.Categoria;
import co.edu.ufps.aspu.entity.Publicacion;
import co.edu.ufps.aspu.service.NoticiaService;
import co.edu.ufps.aspu.util.Answer;

/**
 * Servlet implementation class ActualizarNoticia
 */
@WebServlet("/actualizarNoticia")
public class ActualizarNoticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticiaService noticiaService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarNoticia() {
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
			
		int id = Integer.parseInt(request.getParameter("id"));
		Publicacion noticia =this.noticiaService.buscar(id);
		request.setAttribute("noticia", noticia);
		List<Categoria> list = this.noticiaService.listarCategorias();
		request.setAttribute("categorias", list);
		request.setAttribute("url_action", "actualizarNoticia");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin_registrar_noticia.jsp");
        rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idNoticia = Integer.parseInt(request.getParameter("noticiaId"));		
		int idCategoria = Integer.parseInt(request.getParameter("categoria"));
		String titulo = request.getParameter("titulo");
		String descripcion = request.getParameter("descripcion");
		String palabras = request.getParameter("palabras_clave");
		String contenido = request.getParameter("contenido");
		Answer<String> ret = noticiaService.actualizar(idNoticia, idCategoria, titulo, descripcion, palabras, contenido);
		response.setContentType("application/json");
		JSONObject obj = new JSONObject();
	    obj.put("estado", ret.isEstado());
	    obj.put("mensaje", ret.getValor());
	    PrintWriter out = response.getWriter();
	    out.print(obj);
	}
	

	

}
