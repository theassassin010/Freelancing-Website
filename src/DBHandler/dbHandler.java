package DBHandler;

import java.io.*;
import java.util.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class dbHandler {
	private static String host = "localhost";
	private static String userName = "suyash";
	private static String passWord = "";
	private static String port = "5100";
	private static String connString = "jdbc:postgresql://"+host+":"+port+"/postgres";
	
	public static JSONObject validate(String email, String pswd, String userType){
		JSONObject json = new JSONObject();
	    try{
	    	Connection conn = DriverManager.getConnection(connString, userName, passWord);
	    	PreparedStatement ps;
	    	if(userType.equals("user"))
	    		ps = conn.prepareStatement("select * from freelancingDB.user where email = ? and password = ?");
	    	else if(userType.equals("freelancer"))
	    		ps = conn.prepareStatement("select * from freelancingDB.freelancer where email = ? and password = ?");
	    	else{
				json.put("status",false);
				json.put("message", "Authentication Failed");
				return json;
			}
			ps.setString(1, email);
			ps.setString(2, pswd);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				json.put("status", true);
				if(userType.equals("freelancer")) json.put("uid", rs.getString("fid"));
				else if(userType.equals("user")) json.put("uid", rs.getString("uid"));
				json.put("fName", rs.getString("fName"));
				json.put("email", rs.getString("email"));
			}
			else{
				json.put("status",false);
				json.put("message", "Authentication Failed");
			}
			ps.close();
			conn.close();
		}
	    catch(Exception e){
	    	System.out.println(e);
	    }
	    return json;
	}

	public static boolean createUserAccount(String firstName, String  middleName, String lastName, String email, String password){
		boolean status = false;
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			PreparedStatement ps = conn.prepareStatement("select email from freelancingDB.user where email = '"+email+"'");
			ResultSet rs = ps.executeQuery();  
			status = rs.next();
			if(status) return false;
			ps.close();
			ps = conn.prepareStatement("create sequence if not exists freelancingDB.newUser owned by freelancingDB.user.uid;");
			ps.executeUpdate();
			ps.close();
			String query = "insert into freelancingDB.user values(nextval('freelancingDB.newUser'), ?, ?, ?, ?, ?);";
			ps = conn.prepareStatement(query);
			ps.setString(1, password);
			ps.setString(2, firstName);
			ps.setString(3, middleName);
			ps.setString(4, lastName);
			ps.setString(5, email);
			ps.executeUpdate();
			status = true;
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while creating Account");
			System.out.println(e);
		}
		return status;
	}

	public static boolean createFreelancerAccount(String password, String firstName, String  middleName, String lastName, String email){
		boolean status = false;
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			PreparedStatement ps = conn.prepareStatement("select email from freelancingDB.freelancer where email = '"+email+"'");
			ResultSet rs = ps.executeQuery();  
			status = rs.next();
			if(status) return false;
			ps.close();
			ps = conn.prepareStatement("create sequence if not exists freelancingDB.newFreelancer owned by freelancingDB.freelancer.fid;");
			ps.executeUpdate();
			ps.close();
			String query = "insert into freelancingDB.freelancer values(nextval('freelancingDB.newFreelancer'), ?, ?, ?, ?, ?, ?);";
			ps = conn.prepareStatement(query);
			ps.setString(1, password);
			ps.setString(2, firstName);
			ps.setString(3, middleName);
			ps.setString(4, lastName);
			ps.setString(5, email);
			ps.setInt(6, 0);
			ps.executeUpdate();
			status = true;
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while creating Account");
			System.out.println(e);
		}
		return status;
	}
	
	public static boolean postProject(String uid, String subject, String text, java.sql.Timestamp comp_ts, String minPay, String maxPay){
		boolean status = false;
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			PreparedStatement ps = conn.prepareStatement("create sequence if not exists freelancingDB.newTask owned by freelancingDB.tasks.taskid;");
			ps.executeUpdate();
			ps.close();
			java.sql.Timestamp ts = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
			String query = "insert into freelancingDB.tasks values(nextval('freelancingDB.newTask'), ?, ?, ?, ?, ?, ?, ?);";
			ps = conn.prepareStatement(query);
			ps.setString(1, uid);
			ps.setString(2, subject);
			ps.setString(3, text);
			ps.setTimestamp(4, ts);
			ps.setTimestamp(5, comp_ts);
			ps.setString(6, minPay);
			ps.setString(7, maxPay);
			ps.executeUpdate();
			status = true;
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while posting Project");
			System.out.println(e);
		}
		return status;	
	}
	
	public static boolean assignProject(String taskid, String fid, java.sql.Timestamp comp_ts){
		boolean status = false;
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "insert into freelancingDB.assigned_tasks values(?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, taskid);
			ps.setString(2, fid);
			ps.setTimestamp(3, comp_ts);
			ps.setString(4, "assigned");
			ps.executeUpdate();
			status = true;
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while assigning Project");
			System.out.println(e);
		}
		return status;
	}
	
	public static boolean postBid(String taskid, String fid, java.sql.Timestamp comp_ts, String amount){
		boolean status = false;
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "insert into freelancingDB.bid values(?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, taskid);
			ps.setString(2, fid);
			ps.setTimestamp(3, comp_ts);
			ps.setString(4, amount);
			ps.executeUpdate();
			status = true;
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while posting bid");
			System.out.println(e);
		}
		return status;
	}
	
	public static JSONArray getInterestingProjects(String fid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "with taskids as ("
								+"(select taskid from freelancingDB.tasks)"
								+	" EXCEPT "
								+"(select taskid from freelancingDB.assigned_tasks)"
							+"),"
							+"info as ("
								+"select *" 
								+"from freelancingDB.tasks natural join freelancingDB.has_tags " 
								+"where tagid in ("
									+"select tagid " 
									+"from freelancingDB.has_skills " 
									+"where fid = ?"
								+")"
							+") "
							+"select * from taskids natural join info "
							+ "where taskids.taskid not in ( "
							+	"select taskid from freelancingDB.bid where fid = ? "
							+ ") "
							+ "order by post_ts;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ps.setString(2, fid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while assigning Project");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static JSONArray getProjectsByTag(String fid, JSONArray tags){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "with taskids as ("
								+"(select taskid from freelancingDB.tasks)"
								+	"EXCEPT"
								+"(select taskid from freelancingDB.assigned_tasks)"
							+"),"
							+"info as("
								+"select *" 
								+"from freelancingDB.tasks natural join freelancingDB.has_tags" 
								+"where tagid in ("
									+"select tagid" 
									+"from freelancingDB.has_skills" 
									+"where fid = ?"
								+")"
							+")"
							+"select * from taskids natural join info;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			
			JSONArray ret = new JSONArray();
			for(int i=0; i<jsonArr.length(); i++){
				JSONObject obj = jsonArr.getJSONObject(i);				
				for(int j=0; j<tags.length(); j++){
					JSONObject tag = tags.getJSONObject(i);
					if(obj.getString("tagid").equals(tag.getString("tagid"))){
						jsonArr.remove(i); i--;
						break;
					}
				}
			}
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while getting projects by Tag");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static JSONArray getPendingProjects(String fid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query =   "select a.taskid, fid, a.comp_ts, status, subject, text "
							+"from freelancingDB.assigned_tasks a join freelancingDB.tasks b " 
							+"on a.taskid = b.taskid "
							+"where status = 'working' and fid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while assigning Project");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static JSONArray getAssignedProjects(String fid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query =   "select a.taskid, fid, a.comp_ts, status, subject, text "
							+"from freelancingDB.assigned_tasks a join freelancingDB.tasks b" 
							+"on a.taskid = b.taskid"
							+"where status = 'assigned' and fid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while assigning Project");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static void markAsCompleted(String fid, String taskid){
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "update freelancingDB.assigned_tasks set status = 'completed' where taskid = ? and fid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, taskid);
			ps.setString(2, fid);
			ps.executeUpdate();
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while marking as Completed");
			System.out.println(e);
		}
	}
	
	public static JSONArray getCompletedProjects(String fid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query =   "select b.taskid, c.comp_ts, amount, subject " 
							+"from freelancingDB.bid c natural join freelancingDB.assigned_tasks a join freelancingDB.tasks b on a.taskid = b.taskid "
							+"where status = 'completed' and fid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while Getting Completed Projects");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static JSONArray getOngoingBids(String fid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "select subject, a.taskid, amount, b.comp_ts "
							+"from freelancingDB.tasks a join freelancingDB.bid b on a.taskid = b.taskid "
							+"where fid = ? and a.taskid in "
							+"("
							+ 	"(select taskid "
							+	"from freelancingDB.bid) "
							+	"except "
							+	"(select taskid "
							+	"from freelancingDB.assigned_tasks) "
							+");";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while assigning Project");
			System.out.println(e);
		}
		return jsonArr;
	}

	public static void deleteBid(String fid, String taskid){
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "delete from freelancingDB.bid where fid = ? and taskid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ps.setString(2, taskid);
			ps.executeUpdate();
			ps.close();
			conn.close();			 
		} 
		catch(Exception e){
			System.out.println(e);
		}
	}
	
	public static JSONArray getAllTags(){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query =   "select * from freelancingDB.tag;";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while getting All Tags");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static JSONArray getFreelancerTags(String fid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "select freelancingDB.tag.tagid, freelancingDB.tag.name "
						  +"from freelancingDB.tag natural join freelancingDB.has_skills "
						  +"where fid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while getting Freelancer Tags");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static JSONArray getTaskTags(String taskid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "select freelancingDB.tag.tagid, freelancingDB.tag.name "
						  +"from freelancingDB.tag natural join freelancingDB.has_tags "
						  +"where taskid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, taskid);
			ResultSet rs = ps.executeQuery();
			jsonArr = ResultSetConverter(rs);
			ps.close();
			conn.close();
			return jsonArr;
		}
		catch(Exception e){
			System.out.println("Error while getting Freelancer Tags");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	public static JSONObject getTaskInfo(String taskid){
		JSONObject jsonobj = new JSONObject();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "select subject, text, comp_ts, min_pay, max_pay "
						  +"from freelancingDB.tasks "
						  +"where taskid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, taskid);
			ResultSet rs = ps.executeQuery();
			rs.next();
			jsonobj.put("subject", rs.getString(1));
			jsonobj.put("text", rs.getString(2));
			jsonobj.put("comp_ts", rs.getString(3));
			jsonobj.put("min_pay", rs.getString(4));
			jsonobj.put("max_pay", rs.getString(5));
			ps.close();
			conn.close();
			return jsonobj;
		}
		catch(Exception e){
			System.out.println("Error while getting Task Tags");
			System.out.println(e);
		}
		return jsonobj;
	}
	
	public static boolean updateFreelancerTags(String fid, JSONArray tags){
		boolean status = false;
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "delete from freelancingDB.has_skills where fid = ?;";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, fid);
			ps.executeUpdate();
//			System.out.println(tags);
			for(int i=0; i<tags.length(); i++){
				query = "insert into freelancingDB.has_skills values(?, ?);";
				ps = conn.prepareStatement(query);
				JSONObject obj = tags.getJSONObject(i);
				ps.setString(1, fid);
				String tagid = obj.getString("tagid");
				ps.setString(2, tagid);
				ps.executeUpdate();
			}
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while assigning skills to Freelancers");
			System.out.println(e);
		}
		return status;
	}
	
	public static boolean insertPostTags(String uid, JSONArray tags){
		boolean status = false;
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			
			for(int i=0; i<tags.length(); i++){
				String query = "insert into freelancingDB.has_tags values(?, ?);";
				PreparedStatement ps = conn.prepareStatement(query);
				JSONObject obj = tags.getJSONObject(i);
				ps.setString(1, uid);
				String tagid = obj.getString("tagid");
				ps.setString(2, tagid);
				ps.executeUpdate();
				ps.close();
			}
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while assigning tags to the Task");
			System.out.println(e);
		}
		return status;
	}
	
	public static JSONArray getBidsOnUnassignedTasks(String uid){
		JSONArray jsonArr = new JSONArray();
		try{
			Connection conn = DriverManager.getConnection(connString, userName, passWord);
			String query = "with tmp as ("
										+ "select fid, taskid, comp_ts, fName, amount, rating "
										+"from freelancingDB.bid natural join freelancingDB.freelancer " 
										+"where taskid in ("
						 				+	"("
						 				+ 	"select taskid "
										+		"from freelancingDB.tasks "
										+	"where uid = ?"
						 				+	")"
										+" except "
										+	"("
										+ 	"select taskid "
										+		"from freelancingDB.assigned_tasks"
						 				+	")"
										+"))"
							+" select fid, tmp.taskid, subject, text, t.post_ts, tmp.comp_ts, fName, amount, rating "
							+"from tmp join freelancingDB.tasks as t on tmp.taskid = t.taskid order by taskid "
							+";";
//			String query = "select * from freelancingDB.user where uid = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, uid);
			ResultSet rs = ps.executeQuery();
			jsonArr =  ResultSetConverter(rs);
			ps.close();
			conn.close();
		}
		catch(Exception e){
			System.out.println("Error while getting bids");
			System.out.println(e);
		}
		return jsonArr;
	}
	
	private static JSONArray ResultSetConverter(ResultSet rs) throws SQLException, JSONException {
		// TODO Auto-generated method stub
		JSONArray json = new JSONArray();
		JSONObject jsonResponse = new JSONObject();
	    ResultSetMetaData rsmd = rs.getMetaData();
	    while(rs.next()) {
	        int numColumns = rsmd.getColumnCount();
	        JSONObject obj = new JSONObject();

	        for (int i=1; i<numColumns+1; i++) {
	          String column_name = rsmd.getColumnName(i);

	          if(rsmd.getColumnType(i)==java.sql.Types.ARRAY){
	           obj.put(column_name, rs.getArray(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.BIGINT){
	           obj.put(column_name, rs.getInt(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.BOOLEAN){
	           obj.put(column_name, rs.getBoolean(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.BLOB){
	           obj.put(column_name, rs.getBlob(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.DOUBLE){
	           obj.put(column_name, rs.getDouble(column_name)); 
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.FLOAT){
	           obj.put(column_name, rs.getFloat(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.INTEGER){
	           obj.put(column_name, rs.getInt(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.NVARCHAR){
	           obj.put(column_name, rs.getNString(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.VARCHAR){
	           obj.put(column_name, rs.getString(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.TINYINT){
	           obj.put(column_name, rs.getInt(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.SMALLINT){
	           obj.put(column_name, rs.getInt(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.DATE){
	           obj.put(column_name, rs.getDate(column_name));
	          }
	          else if(rsmd.getColumnType(i)==java.sql.Types.TIMESTAMP){
	          obj.put(column_name, rs.getTimestamp(column_name));   
	          }
	          else{
	           obj.put(column_name, rs.getObject(column_name));
	          }
	        }

	        json.put(obj);
	      }
	    return json;
	}
}
