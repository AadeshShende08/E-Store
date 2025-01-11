package com.MainApp.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Entity.Admin;
@Repository
public interface Adminrepositroy extends CrudRepository<Admin, String> {
	
	Admin findByUname(String uname);
	
	Admin findByUnameAndUpass(String uname, String upass);

}
