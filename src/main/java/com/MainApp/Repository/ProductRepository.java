package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Entity.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer>
{

	List<Product> findByAname(String aname);
	
	void deleteByAnameAndPid(String aname, int pid);
	
	Product findByAnameAndPid(String aname, int pid);
	
	List<Product> findByPcatOrPname(String pcat, String pname);
	
	List<Product> findAll();
}
