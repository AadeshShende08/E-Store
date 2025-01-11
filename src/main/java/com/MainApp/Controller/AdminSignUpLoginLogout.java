package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Entity.Admin;
import com.MainApp.Entity.Product;
import com.MainApp.Service.AdminService;
import com.MainApp.Service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminSignUpLoginLogout {
	
	@Autowired
	AdminService aService;
	
	@Autowired
	ProductService pService;
	
	@RequestMapping(value = "/admin")
	public String showAdminSignUp()
	{
		return "AdminSignUp";
	}
	
	@RequestMapping(value = "/xyz")
	public String showAdminlogin()
	{
		return "AdminLogin";
	}
	
	@RequestMapping(value = "/asignup")
	public ModelAndView processAsignUp(@ModelAttribute Admin a)
	{
		ModelAndView mv = new ModelAndView("AdminSignUp");
		String res=aService.addAdmin(a);
		
		if(res.equals("added"))
		{
			mv.addObject("msg", "Account created successfuly");
		}
		else
		{
			mv.addObject("msg", "Account creation failed");
		}
		return mv;
	}
	
	@RequestMapping(value = "/alogin")
	public ModelAndView processAlogin(@RequestParam("uname") String uname, 
			@RequestParam("upass") String upass, HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView();
		String res=aService.checkAdmin(uname, upass);
		if(res.equals("exists"))
		{
			List<Product> lp= pService.readAllProducts(uname);
			HttpSession s = req.getSession();
			s.setAttribute("acheck", uname);
			mv.setViewName("AdminHome");
			mv.addObject("lp", lp);
		}
		else
		{
			mv.setViewName("AdminLogin");
			mv.addObject("msg", "Invalid credentials");
		}
		return mv;
	}
	
	@RequestMapping(value = "/alogout")
	public String processALogout(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.removeAttribute("acheck");
		return "AdminLogin";
	}
	
	

}







