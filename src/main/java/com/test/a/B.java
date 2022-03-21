package com.test.a;

import org.springframework.stereotype.Component;

public class B {
	private int p;
	
	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public B() {
		
	}

	public void hi() {
		// TODO Auto-generated method stub
		System.out.println("hi" + p);
		
	}
	
	
}
