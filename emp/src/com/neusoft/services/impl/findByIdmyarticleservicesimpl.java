package com.neusoft.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class findByIdmyarticleservicesimpl extends JdbcServicesSupport 
{

	public findByIdmyarticleservicesimpl(Map<String, Object> dto) {
		super(dto);
		// TODO Auto-generated constructor stub
	}
	public boolean deletemyarticle()throws Exception
	{
		String sql ="delete  from ac03 where aac301=?";
		return this.executeUpdate(sql, this.get("aac301"))>0;
	}
	
	
}
