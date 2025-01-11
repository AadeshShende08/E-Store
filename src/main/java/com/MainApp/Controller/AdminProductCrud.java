package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Entity.Product;
import com.MainApp.Service.ProductService;

import jakarta.transaction.Transactional;

@Controller
@Transactional
public class AdminProductCrud {
	
	@Autowired
	ProductService pService;
	
	@RequestMapping(value = "/addproduct")
	public ModelAndView processAddProduct(@ModelAttribute Product p,
			@RequestParam("pimage") MultipartFile f)
	{
		pService.addProduct(p, f);
		ModelAndView mv = new ModelAndView("AdminHome");
		List<Product> lp = pService.readAllProducts(p.getAname());
		mv.addObject("lp", lp);
		return mv;
	}
	
	
	@RequestMapping(value = "/deleteproduct")
	public ModelAndView processDeleteProduct(@RequestParam("aname") String aname, 
		@RequestParam("pid") int pid)
	{
		pService.deleteProduct(aname, pid);
		List<Product> lp = pService.readAllProducts(aname);
		ModelAndView mv = new ModelAndView("AdminHome");
		mv.addObject("lp", lp);
		return mv;
	}
	
	
	@RequestMapping(value = "/editproduct")
	public ModelAndView processEditProduct(@RequestParam("aname") String aname, 
			@RequestParam("pid") int pid)
	{
		ModelAndView mv = new ModelAndView("AdminHome");
		Product p = pService.getProduct(aname, pid);
		List<Product> lp = pService.readAllProducts(aname);
		mv.addObject("p", p);
		mv.addObject("lp", lp);
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
