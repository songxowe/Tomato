package com.spring.pojo;

import java.util.Date;


public class VVideo implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String videoname;
	private String introduce;
	private String filetype;
	private String timer;
	private String isshow;
	private Date releasetime;

	public VVideo() {
	}
	

	public String getIsshow() {
		return isshow;
	}


	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVideoname() {
		return this.videoname;
	}

	public void setVideoname(String videoname) {
		this.videoname = videoname;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getFiletype() {
		return this.filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public String getTimer() {
		return this.timer;
	}

	public void setTimer(String timer) {
		this.timer = timer;
	}

	public Date getReleasetime() {
		return this.releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}

}