package TaskRelated;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import java.sql.Date;
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
 * Servlet implementation class tasks
 */
@WebServlet("/tasks")
public class tasks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tasks() {
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
		if(request.getParameter("getTags") != null){
			HttpSession session = request.getSession(false);
 			if(session != null){
				JSONArray jsArr = dbHandler.getAllTags();
				response.getWriter().write(jsArr.toString());
 			}
 			else{
 				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
		        rd.include(request,response);
 			}
		}
		else if(request.getParameter("insertPostTags") != null){
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
	 				String uid = (String) session.getAttribute("uid");
	 				String subject = request.getParameter("subject");
	 				String text = request.getParameter("text");
	 				String compDate = request.getParameter("comp_ts");
	 				String minPay = request.getParameter("min_Pay"); 
	 				String maxPay = request.getParameter("max_Pay");
	 				java.util.Date utilDate = new java.util.Date();
	 				utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(compDate);
	 				java.sql.Timestamp sq = new java.sql.Timestamp(utilDate.getTime());  
	 				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 				java.sql.Timestamp ts = java.sql.Timestamp.valueOf(sdf.format(sq));
	 				dbHandler.postProject(uid, subject, text, ts, minPay, maxPay);
	 				JSONObject json = dbHandler.getTaskID(uid, subject, text);
	 				String taskid = json.getString("taskid");
	 				dbHandler.insertPostTags(taskid, tags);
	 				RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");  
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
	}

}
