package com.spring.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.spring.pojo.VVideo;
import com.spring.service.VideoService;

public class videoTest {
	private VideoService videoService;
	@SuppressWarnings("resource")
	@Before
	public void init(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		videoService = ctx.getBean("productService",VideoService.class);
	}
	@Test
	public void test(){
		List<VVideo> videos = videoService.query();
		for(VVideo v : videos){
			System.out.println(v.getVideoname()+"----"+v.getIsshow());
		}
	}
}
