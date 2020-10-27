package com.qf.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.qf.bean.Category;
import com.qf.bean.RecordBean;
import com.qf.bean.Users;
import com.qf.dao.DbHelper;

@WebServlet("/dada")
public class Servlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setHeader("Access-Control-Allow-Origin", "*");
		resp.setHeader("Content-Type","text/html; charset=utf-8");
		
		if(req.getParameter("m")==null){
			
	        File file = new File(req.getSession().getServletContext().getRealPath("")+"\\index.html");
	        FileReader reader = new FileReader(file);
	        BufferedReader bReader = new BufferedReader(reader);
	        StringBuilder sb = new StringBuilder();
	        String s = "";
	        while ((s =bReader.readLine()) != null) {
	            sb.append(s + "\n");
	        }
	        bReader.close();
	        String str = sb.toString();
	        resp.getWriter().print(str);

		}else {
			String method = req.getParameter("m");
			switch (method) {
			case "getall":
				List<RecordBean> list = DbHelper.findAllRecord();
				String json = new Gson().toJson(list);  // list变j串
		        resp.getWriter().print(json);
				break;
				
			case "getcategory":
				List<Category> clist = DbHelper.findAllCategory();
				String cjson = new Gson().toJson(clist);  // list变j串
		        resp.getWriter().print(cjson);
				break;
				
			case "getusers":
				List<Users> ulist = DbHelper.findAllUsers();
				String ujson = new Gson().toJson(ulist);  // list变j串
		        resp.getWriter().print(ujson);
				break;
					
				
			case "uploadRecord":
				String name = req.getParameter("name");
				String region = req.getParameter("region");
				String time = req.getParameter("time");
				String imgpath = req.getParameter("imgpath");
				String category = req.getParameter("category");

				RecordBean recordBean = new RecordBean();
				recordBean.setName(name);
				recordBean.setRegion(region);
				recordBean.setTime(time);
				recordBean.setImgpath(imgpath);
				recordBean.setCategory(category);
				// 调用工具类数据库插入数据方法
				RecordBean lastRecord = DbHelper.addRecord(recordBean);
				List<RecordBean> lastList=new ArrayList<>();
				lastList.add(lastRecord);
				String lastJson=new Gson().toJson(lastList);
				System.out.println(lastJson);
				resp.getWriter().println(lastJson);
				break;
			case "deleteRecord":
				int id = Integer.valueOf(req.getParameter("flag"));
				if (DbHelper.deleteRecord(id) > 0) {
					System.out.println("刪除成功");
					resp.getWriter().print(new Gson().toJson("200"));
				} else {
					System.out.println("刪除失敗");
					resp.getWriter().print(new Gson().toJson("400"));
				}
				break;
			default:
				break;
			}
		}
		
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
