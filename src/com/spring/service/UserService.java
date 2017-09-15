package com.spring.service;


import com.spring.pojo.VUser;
import com.spring.util.Pager;

public interface UserService {
	VUser findById(final String username,final String password);
	
	void add(VUser user);
	
	void remove(VUser user);
	
	void modify(VUser user);
	
	Pager<VUser> find(String username,Integer page, Integer rows,String sort,String order);
	
}
