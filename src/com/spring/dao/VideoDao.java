package com.spring.dao;

import java.util.List;

import com.spring.pojo.VVideo;
import com.spring.util.Pager;

public interface VideoDao {
	void add(VVideo video);
	
	void remove(VVideo video);
	
	void modify(VVideo video);
	
	List<VVideo> query();
	
	List<VVideo> query12();
	
	Pager<VVideo> find(String videoname, String filetype, Integer page, Integer rows,String sort,String order,String show);
}
