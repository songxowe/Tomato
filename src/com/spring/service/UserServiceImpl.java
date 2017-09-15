package com.spring.service;

import java.util.List;

import com.spring.dao.UserDao;
import com.spring.pojo.VUser;
import com.spring.pojo.VVideo;
import com.spring.util.Pager;

public class UserServiceImpl implements UserService {
private UserDao userDao;
	@Override
	public void add(VUser user) {
		userDao.add(user);
	}
	@Override
	public VUser findById(String username, String password) {
		return userDao.findById(username, password);
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public Pager<VUser> find(String username, Integer page, Integer rows, String sort, String order) {
		return this.userDao.find(username, page, rows, sort, order);
	}
	@Override
	public void remove(VUser user) {
		this.userDao.remove(user);
	}
	@Override
	public void modify(VUser user) {
		this.userDao.modify(user);
	}

}
