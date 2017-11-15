package Login;

import DBHandler.dbHandler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Login
 */
@WebServlet(description = "Login Function for Freelancer and User", urlPatterns = { "/Login" })
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String userType = request.getParameter("userType");
	    JSONObject obj = new JSONObject(); 
	    Boolean status = false;

	    try{
	    	if(userType.equals("freelancer")){
		    	obj = dbHandler.validate(email, password, userType);
		    	status = obj.getBoolean("status");
		    }
		    else if(userType.equals("user")){
		    	obj = dbHandler.validate(email, password, userType);
		    	status = obj.getBoolean("status");
		    }
	    	if(status){
		    	String fName = obj.getString("fName");
		    	String uid = obj.getString("uid");
		    	HttpSession session = request.getSession(true);
		    	session.setAttribute("uid", uid);
		    	session.setAttribute("fName", fName);
		    	session.setAttribute("email", email);
		    	if(userType.equals("freelancer")) response.sendRedirect("FreelancerHome.jsp");
		    	else if(userType.equals("user")) response.sendRedirect("UserHome.jsp");
	    	}
		    else{
		    	response.setContentType("text/html");
			    PrintWriter out = response.getWriter();
		        out.print("Sorry username or password incorrect");  
		        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);  
		    }
	    }
	    catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error in doPost of Login");
			e.printStackTrace();
		}
	}

}
