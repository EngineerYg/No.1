package com.gly.util;

public class PwdUtil {
	public int setSaId(String pwd){
		int said = 1;
		if(pwd.length()>=15 && pwd.indexOf(".")!=-1||pwd.indexOf("@")!=-1 || pwd.indexOf("!")!=-1 || pwd.indexOf("#")!=-1){
			said =5;
		}else if(pwd.indexOf(".")!=-1&&pwd.length()>=10){
			said=4;
		}else if(pwd.indexOf(".")!=-1&&pwd.length()>=6){
			said=3;
		}else {
			said=2;
		}
		return said;
	}
}
