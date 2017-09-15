package com.spring.action;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.spring.pojo.VUser;
import com.spring.util.Pager;
import com.spring.service.UserService;
import com.spring.util.MD5;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

public class UserAction implements SessionAware {
	private UserService userService;
	private VUser user;
	private String validateCode;
	private Map<String, Object> session;
	private String repassword;

	public String login() {
		String fromSessionValidateCode = (String) session.get("validateCode");
		
		if (!validateCode.equals(fromSessionValidateCode)) {
			return "input";
		}
		user = userService.findById(user.getUsername(), MD5.getMD5(user.getPassword()));
		if (user == null) {
			return "input";
		}
		//登陆成功后记录session
		session.put("user", user);
		
		if("0".equals(user.getRole())){
			return "manage";
		}
		if("1".equals(user.getRole())){
			return "guest";
		}
		
		return "input";
	}

	public String add() {
		if (user != null) {
			user.setPassword(MD5.getMD5(user.getPassword()));
			userService.add(user);
		} else {
			return "input";
		}
		return "add";
	}
	public String modify(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		PrintWriter out = response.getWriter();
		String username = request.getParameter("user[username]");
		String password = request.getParameter("user[password]");
		String role = request.getParameter("user[role]");
		VUser user = new VUser();
		user.setUsername(username);
		user.setPassword(password);
		user.setRole(role);
		userService.modify(user);
		out.println(1);
		out.flush();
		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public String list() {
		// 1.获得request / response 对象
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			// 2.获得easyui 分页参数和条件查询参数
			Integer page = NumberUtils.createInteger(request.getParameter("page"));
			Integer rows = NumberUtils.createInteger(request.getParameter("rows"));
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String username = request.getParameter("username");
			// 3.获得分页结果集
			Pager<VUser> pager = userService.find(username, page, rows, sort, order);
			//System.out.println("总记录数:" + pager.getTotal() + "分页数据长度:" + pager.getRows().size());
			/*for (VUser u : pager.getRows()) {
				System.out.println(u.getUsername());
			}*/
			// 4.分页结果集转换为json
			//System.out.println(12222);
			JsonConfig jsonConfig = new JsonConfig();

			JSONObject json = (JSONObject) JSONSerializer.toJSON(pager, jsonConfig);

			// 5.把json数据写入至客户端
			//System.out.println(json.toString());
			out.println(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public String remove() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			PrintWriter out = response.getWriter();
			String[] users = request.getParameter("users").split(",");
			for (int i = 0; i < users.length; i++) {
				VUser user = new VUser();
				user.setUsername(users[i]);
				userService.remove(user);
			}
			out.println(users.length);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public VUser getUser() {
		return user;
	}

	public void setUser(VUser user) {
		this.user = user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
