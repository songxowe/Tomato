package com.spring.action;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.struts2.ServletActionContext;

import com.spring.util.JsonDateValueProcessor;
import com.spring.pojo.VVideo;
import com.spring.service.VideoService;
import com.spring.util.Pager;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

public class VideoAction {
	private VideoService videoService;
	private VVideo video;
	private List<VVideo> videos;
	
	public String add(){
		videoService.add(video);
		return null;
	}
	public String list() {
		System.out.println("进入list了。。");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			String show = request.getParameter("show");
			Integer page = NumberUtils.createInteger(request.getParameter("page"));
			Integer rows = NumberUtils.createInteger(request.getParameter("rows"));
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String videoname = request.getParameter("videoname");
			String filetype = request.getParameter("filetype");
			Pager<VVideo> pager = videoService.find(videoname, filetype, page, rows, sort, order,show);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor("yyyy-MM-dd"));
			jsonConfig.setJsonPropertyFilter(new PropertyFilter() {
				
				@Override
				public boolean apply(Object source, String name, Object value) {
					return false;
				}
			});
			JSONObject json = (JSONObject) JSONSerializer.toJSON(pager,jsonConfig);

			out.println(json.toString());
			//System.out.println(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	public String remove() {
		System.out.println("进入remove了。。。");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			PrintWriter out = response.getWriter();
			String[] videos = request.getParameter("videos").split(",");
			for (int i = 0; i < videos.length; i++) {
				VVideo video = new VVideo();
				System.out.println(videos[i]);
				video.setId(Integer.parseInt(videos[i]));
				videoService.remove(video);
			}
			out.println(videos.length);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String modify(){
		System.out.println("进入modify了。。。");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		PrintWriter out = response.getWriter();
		
		Integer id = NumberUtils.createInteger(request.getParameter("video[id]"));
		String videoname = request.getParameter("video[videoname]");
		String introduce = request.getParameter("video[introduce]");
		String filetype = request.getParameter("video[filetype]");
		String timer = request.getParameter("video[timer]");
		String date = request.getParameter("video[releasetime]");
		String isshow = request.getParameter("video[isshow]");
		//时间格式
		Date releasetime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			releasetime = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			releasetime = null;
		}
		
		VVideo video = new VVideo();
		video.setId(id);
		video.setVideoname(videoname);
		video.setIntroduce(introduce);
		video.setFiletype(filetype);
		video.setTimer(timer);
		video.setReleasetime(releasetime);
		video.setIsshow(isshow);
		videoService.modify(video);
		out.println(1);
		out.flush();
		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public String show(){
		System.out.println("进入show了。。。");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		PrintWriter out = response.getWriter();
		//video.jsp主推视频个数
		Integer length = NumberUtils.createInteger(request.getParameter("length"));
		//show.jsp取消推荐所用传参判断
		String cancel = request.getParameter("cancel");
		int i = 0;
		String isshow ;
		if (StringUtils.isNotBlank(cancel)) {
			isshow = "0";
		}else{
			isshow = "1";
		}
		for(i = 0; i < length; i++){
			Integer id = NumberUtils.createInteger(request.getParameter("videos["+i+"][id]"));
			String videoname = request.getParameter("videos["+i+"][videoname]");
			String introduce = request.getParameter("videos["+i+"][introduce]");
			String filetype = request.getParameter("videos["+i+"][filetype]");
			String timer = request.getParameter("videos["+i+"][timer]");
			String date = request.getParameter("videos["+i+"][releasetime]");
			//时间格式
			Date releasetime = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				releasetime = sdf.parse(date);
			} catch (ParseException e) {
				//e.printStackTrace();
				releasetime = null;
			}
			
			VVideo video = new VVideo();
			video.setId(id);
			video.setVideoname(videoname);
			video.setIntroduce(introduce);
			video.setFiletype(filetype);
			video.setTimer(timer);
			video.setReleasetime(releasetime);
			video.setIsshow(isshow);
			videoService.modify(video);
		}
		out.println(length);
		out.flush();
		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String deliver(){
		System.out.println("进入");
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			String videoname = request.getParameter("videoname");
			request.setAttribute("videoname", videoname);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("chuqu");
		return "deliver";
	}
	
	public VideoService getVideoService() {
		return videoService;
	}
	public void setVideoService(VideoService videoService) {
		this.videoService = videoService;
	}
	public VVideo getVideo() {
		return video;
	}
	public void setVideo(VVideo video) {
		this.video = video;
	}
	public List<VVideo> getVideos() {
		return videos;
	}
	public void setVideos(List<VVideo> videos) {
		this.videos = videos;
	}
	
	
}
