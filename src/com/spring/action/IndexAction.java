package com.spring.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.spring.service.VideoService;

public class IndexAction {
	private VideoService videoService;
	
	public String execute(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setContentType("text/html;charset=utf-8");
		request.setAttribute("video", videoService.query12());
		return "success"; 
	}
	public VideoService getVideoService() {
		return videoService;
	}
	public void setVideoService(VideoService videoService) {
		this.videoService = videoService;
	}
}
