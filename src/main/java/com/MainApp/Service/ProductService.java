package com.MainApp.Service;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.MainApp.Entity.Product;
import com.MainApp.Repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository pRepo;
	
	public void addProduct(Product p, MultipartFile f)
	{
		String pimagename=f.getOriginalFilename();
		p.setPimagename(pimagename);
		if(pimagename.equals(""))
		{
			Product pp=pRepo.findByAnameAndPid(p.getAname(), p.getPid());
			String x=pp.getPimagename();
			
			p.setPimagename(x);
		}
		pRepo.save(p);
		FileOutputStream fos =null;
		try
		{
			InputStream is = f.getInputStream();
			byte[] b = is.readAllBytes();
			
			String path="Z:\\adv java 13th Nov 2024 11 to 2 pm\\sping boot\\e-com\\src\\main\\webapp\\images\\"+pimagename;
			fos = new FileOutputStream(path);
			fos.write(b);
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		finally
		{
			try
			{
				fos.close();
			}
			catch (Exception e)
			{
				System.out.println(e);
			}
		}
	}
	
	public List<Product> readAllProducts(String aname)
	{
		return pRepo.findByAname(aname);
	}
	
	
	public void deleteProduct(String aname, int pid)
	{
		pRepo.deleteByAnameAndPid(aname, pid);
	}
	
	
	
	public Product getProduct(String aname, int pid)
	{
		return pRepo.findByAnameAndPid(aname, pid);
	}
	
	
	
	public List<Product> getAllProducts()
	{
		return pRepo.findAll();
	}
	
	public Set<String> getproductsCat()
	{
		List<Product> l = pRepo.findAll();
		Set<String> cl = new HashSet<String>();
		for(Product p:l)
		{
			cl.add(p.getPcat());
		}
		return cl;
	}
	
	
	
	

}
