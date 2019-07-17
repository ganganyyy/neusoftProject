package com.neusoft.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class TestServicesImpl extends JdbcServicesSupport
{
	private boolean addVoteOption() throws Exception
	{
		
		StringBuilder sql = new StringBuilder()
				.append("insert into ae02(aae203,aae202,aae204,aae205)")
				.append("     values (?,?,?,CURRENT_TIMESTAMP())")
				;
		System.out.println("在这个service里"+this.get("msg"));
		Object args[]={
			//this.get("aae203"),
			this.get("msg"),
			0,
			1
			//this.get("aae204")
		};
		return this.executeUpdate(sql.toString(), args)>0;
		
	}
}
