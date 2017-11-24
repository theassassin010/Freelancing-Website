package TaskRelated;

import java.io.IOException;
import java.text.SimpleDateFormat;

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
 * Servlet implementation class BidRelated
 */
@WebServlet("/BidRelated")
public class BidRelated extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BidRelated() {
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
		if(request.getParameter("getBidsOnUnassignedTasks") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getBidsOnUnassignedTasks(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getTaskTags") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String taskid = request.getParameter("taskid");
				JSONArray jsArr = dbHandler.getTaskTags(taskid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getTaskInfo") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String taskid = request.getParameter("taskid");
 				JSONObject jsobj = dbHandler.getTaskInfo(taskid);
				response.getWriter().write(jsobj.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("Bid") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String taskid = request.getParameter("taskid");
 				session.setAttribute("taskid", taskid);
 				RequestDispatcher rd = request.getRequestDispatcher("postbid.jsp");
		        rd.include(request,response);
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("postBid") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				try{
	 				String taskid = request.getParameter("taskid");
	 				String fid = (String) session.getAttribute("uid");
	 				String comp_ts = request.getParameter("comp_ts");
	 				String amount = request.getParameter("amount");
	 				java.util.Date utilDate = new java.util.Date();
	 				utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(comp_ts);
	 				java.sql.Timestamp sq = new java.sql.Timestamp(utilDate.getTime());
	 				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 				java.sql.Timestamp ts = java.sql.Timestamp.valueOf(sdf.format(sq));
	 				dbHandler.postBid(taskid, fid, ts, amount);
	 				RequestDispatcher rd = request.getRequestDispatcher("FreelancerHome.jsp");
			        rd.include(request,response);
 				}
 				catch(Exception e){
					System.out.println(e);
 				}
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getBidSummary") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String uid = (String) session.getAttribute("uid");
				JSONArray jsArr = dbHandler.getBidSummary(uid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getBidDetails") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String taskid = request.getParameter("taskid");
				JSONArray jsArr = dbHandler.getBidDetails(taskid);
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("getAllBidsOnTask") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				String taskid = request.getParameter("taskid");
 				String subject = request.getParameter("subject");
 				String text = request.getParameter("text");
 				String post_ts = request.getParameter("post_ts");
 				session.setAttribute("taskid", taskid);
 				RequestDispatcher rd = request.getRequestDispatcher("viewBids.jsp");
		        rd.include(request,response);
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("assignProject") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
 				try{
	 				String taskid = request.getParameter("taskid");
	 				String comp_ts = request.getParameter("comp_ts");
	 				String fid = request.getParameter("fid");
	 				java.util.Date utilDate = new java.util.Date();
	 				utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(comp_ts);
	 				java.sql.Timestamp sq = new java.sql.Timestamp(utilDate.getTime());
	 				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 				java.sql.Timestamp ts = java.sql.Timestamp.valueOf(sdf.format(sq));
	 				dbHandler.assignProject(taskid, fid, ts);
	 				RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
			        rd.include(request,response);
 				}
 				catch(Exception e){
					System.out.println(e);
 				}
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		        rd.include(request,response);
 			}
		}
	}
}
