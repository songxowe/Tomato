package com.spring.service;

import java.util.List;

import com.spring.dao.VideoDao;
import com.spring.pojo.VVideo;
import com.spring.service.VideoService;
import com.spring.util.Pager;

public class VideoServiceImpl implements VideoService {
private VideoDao videoDao;
	@Override
	public void add(VVideo video) {
		videoDao.add(video);
	}

	@Override
	public void remove(VVideo video) {
		videoDao.remove(video);
	}

	@Override
	public void modify(VVideo video) {
		videoDao.modify(video);
	}

	@Override
	public Pager<VVideo> find(String videoname, String filetype, Integer page, Integer rows, String sort,
			String order,String show) {
		return videoDao.find(videoname, filetype, page, rows, sort, order,show);
	}

	public VideoDao getVideoDao() {
		return videoDao;
	}

	public void setVideoDao(VideoDao videoDao) {
		this.videoDao = videoDao;
	}

	@Override
	public List<VVideo> query() {
		return this.videoDao.query();
	}

	@Override
	public List<VVideo> query12() {
		return this.videoDao.query12();
	}
	
	

}
