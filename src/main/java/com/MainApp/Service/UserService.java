package com.MainApp.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.User;
import com.MainApp.Repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository uRepo;
	
	public String addUser(User u)
	{
		if(uRepo.findByUname(u.getUname()) != null)
		{
			return "already exists";
		}
		else
		{
			uRepo.save(u);
			return "added";
		}
	}
	
	
	public String checkUser(String uname, String upass)
	{
		if(uRepo.findByUnameAndUpass(uname, upass) != null)
		{
			return "exists";
		}
		else
		{
			return "not exists";
		}
	}
	
	
	

}
