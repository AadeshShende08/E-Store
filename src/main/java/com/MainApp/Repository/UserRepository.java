package com.MainApp.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Entity.User;

@Repository
public interface UserRepository extends CrudRepository<User, String>{

	User findByUname(String uname);
	
	User findByUnameAndUpass(String uname, String upass);
}
