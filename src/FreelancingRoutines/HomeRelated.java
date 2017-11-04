package FreelancingRoutines;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import DBHandler.dbHandler;

/**
 * Servlet implementation class HomeRelated
 */
@WebServlet("/HomeRelated")
public class HomeRelated extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeRelated() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("getInterestingProjects") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getInterestingProjects(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.html");  
		        rd.include(request,response);
 			}
		}
	}

}
