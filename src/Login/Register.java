package Login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import DBHandler.dbHandler;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		if(request.getParameter("ConfirmRegisterFreelancer") != null){
			String password = request.getParameter("password");
			String fName = request.getParameter("fName");
			String mName = request.getParameter("mName");
			String lName = request.getParameter("lName");
			String email = request.getParameter("email");
			boolean status = dbHandler.createFreelancerAccount(password, fName, mName, lName, email);
			if(status) {
//				response.setContentType("application/json");
//			    response.setCharacterEncoding("UTF-8");
				try{
					JSONObject obj = new JSONObject();
					obj = dbHandler.validate(email, password, "freelancer");
					HttpSession session = request.getSession(true);
			    	session.setAttribute("uid", obj.getString("uid"));
			    	session.setAttribute("fName", obj.getString("fName"));
			    	session.setAttribute("email", obj.getString("email"));
					response.setContentType("text/html");
				    PrintWriter out = response.getWriter();
				    request.getRequestDispatcher("AddTags.jsp").forward(request, response);
				}
				catch (Exception e){
					System.out.println(e);
				}
			}
			else{
		    	response.setContentType("text/html");
			    PrintWriter out = response.getWriter();
		        out.print("Sorry Something went wrong, Create Account Again");
			    request.getRequestDispatcher("RegisterFreelancer.jsp").forward(request, response);
			}			
		}
		else if(request.getParameter("ConfirmRegisterUser") != null){
			String password = request.getParameter("password");
			String fName = request.getParameter("fName");
			String mName = request.getParameter("mName");
			String lName = request.getParameter("lName");
			String email = request.getParameter("email");
			boolean status = dbHandler.createUserAccount(fName, mName, lName, email, password);
			if(status) {
//				response.setContentType("application/json");
//			    response.setCharacterEncoding("UTF-8");
				try{
					JSONObject obj = new JSONObject();
					obj = dbHandler.validate(email, password, "user");
					HttpSession session = request.getSession(true);
			    	session.setAttribute("uid", obj.getString("uid"));
			    	session.setAttribute("fName", obj.getString("fName"));
			    	session.setAttribute("email", obj.getString("email"));
					response.setContentType("text/html");
				    PrintWriter out = response.getWriter();
			        out.print("Post Your First Task");
				    request.getRequestDispatcher("PostTask.jsp").forward(request, response);
				}
				catch (Exception e){
					System.out.println(e);
				}
			}
			else{
		    	response.setContentType("text/html");
			    PrintWriter out = response.getWriter();
		        out.print("Sorry Something went wrong, Create Account Again");
			    request.getRequestDispatcher("RegisterUser.jsp").forward(request, response);
			}
		}
		else if(request.getParameter("RegisterUser") != null){
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    request.getRequestDispatcher("RegisterUser.jsp").forward(request, response);
		}
		else if(request.getParameter("RegisterFreelancer") != null){
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    request.getRequestDispatcher("RegisterFreelancer.jsp").forward(request, response);
		}
	}
}
