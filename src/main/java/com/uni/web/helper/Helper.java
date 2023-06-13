/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uni.web.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;

/**
 *
 * @author Deepanshu
 */
public class Helper {
	public static boolean deleteFile(String path)
	{
	boolean f = false;
	try{
	File file = new File(path);
	f=file.delete();
	}catch(Exception e)
	{
	e.printStackTrace();
	}
	
	
	
	return f;
	}
	public static boolean saveFile(InputStream is, String path)
	{
		boolean f =false;
		try{
			byte b[] = new byte[is.available()];
			is.read(b);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public static boolean saveDataFile(String fileData, String path)
	{
		System.out.println(fileData);
		boolean f =false;
		try{
			FileWriter fos = new FileWriter(path);
			fos.write(fileData);
			fos.flush();
			fos.close();
			f=true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
}
