package com.MainApp.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.Admin;
import com.MainApp.Repository.Adminrepositroy;

@Service
public class AdminService {
	
	@Autowired
	Adminrepositroy aRepo;
	
	
	public String addAdmin(Admin a)
	{
		if(aRepo.findByUname(a.getUname()) != null)
		{
			return "already exists";
		}
		else
		{
			aRepo.save(a);
			return "added";
		}
	}
	
	
	
	public String checkAdmin(String uname, String upass)
	{
		if(aRepo.findByUnameAndUpass(uname, upass) != null)
		{
			return "exists";
		}
		else
		{
			return "not exists";
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	

}
