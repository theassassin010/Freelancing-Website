package FreelancingRoutines;

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
import org.json.JSONObject;

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
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getPendingProjects") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getPendingProjects(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("markAsCompleted") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
 				String taskid = request.getParameter("taskid");
 				dbHandler.markAsCompleted(uid, taskid);
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getCompletedProjects") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getCompletedProjects(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getOngoingBids") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getOngoingBids(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("deleteBid") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
 				String taskid = request.getParameter("taskid");
 				dbHandler.deleteBid(uid, taskid);
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getAllTags") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
 				JSONArray jsArr = dbHandler.getAllTags();
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getFreelancerTags") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getFreelancerTags(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("updateFreelancerTags") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String[] values = request.getParameterValues("checkedTags");
 				try{
	 				JSONArray tags = new JSONArray();
	 				for (String value : values) {
	 					JSONObject json = new JSONObject();
	 					json.put("tagid", value);
	 					tags.put(json);
	 				}
	 				dbHandler.updateFreelancerTags((String) session.getAttribute("uid"), tags);
	 				RequestDispatcher rd = request.getRequestDispatcher("FreelancerHome.jsp");  
			        rd.include(request,response);
 				}
				catch (Exception e){
					System.out.println(e);
				}
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getOngoingProjects") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getOngoingProjects(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getNewlyAssignedProjects") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getNewlyAssignedProjects(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("markAsWorking") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
 				String taskid = request.getParameter("taskid");
 				dbHandler.markAsWorking(uid, taskid);
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("logout") != null){
			response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();
	    	try{ 
	        	HttpSession session=request.getSession();
		        session.invalidate(); 
		        out.println("Login Again"); 
		    	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);  
	        }
	        catch(Exception e){
		    	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);  
	        }
	        out.close();    	
		}
	}

}
