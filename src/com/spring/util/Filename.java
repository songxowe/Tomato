package com.spring.util;

import java.io.File;
import java.io.FilenameFilter;

public class Filename implements FilenameFilter {

	@Override
	public boolean accept(File dir, String name) {
		if(name.endsWith(".mp4")){
			return true;
		}
		return false;
	}

}
