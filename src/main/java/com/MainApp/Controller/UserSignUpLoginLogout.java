package com.MainApp.Controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Entity.Admin;
import com.MainApp.Entity.Product;
import com.MainApp.Entity.User;
import com.MainApp.Service.ProductService;
import com.MainApp.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserSignUpLoginLogout {
	
	@Autowired
	UserService uService;
	
	@Autowired
	ProductService pService;
	
	@RequestMapping(value = "/user")
	public String showUserSignUp()
	{
		return "UserSignUp";
	}
	
	@RequestMapping(value = "/pqr")
	public String showUserLogin()
	{
		return "UserLogin";
	}

	
	@RequestMapping(value = "/usignup")
	public ModelAndView processUsignUp(@ModelAttribute User u)
	{
		ModelAndView mv = new ModelAndView("UserSignUp");
		String res=uService.addUser(u);
		
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
	
	
	@RequestMapping(value = "/ulogin")
	public ModelAndView processULogin(@RequestParam("uname") String uname
			,@RequestParam("upass") String upass, HttpServletRequest req)
	{
		
		String res=uService.checkUser(uname, upass);
		ModelAndView mv = new ModelAndView();
		
		List<Product> lap = pService.getAllProducts();
		Set<String> soc = pService.getproductsCat();//set of p cat
		if(res.equals("exists"))
		{
			mv.setViewName("UserHome");
			HttpSession s = req.getSession();
			s.setAttribute("ucheck", uname);
			mv.addObject("lap", lap);
			mv.addObject("soc", soc);
		}
		else
		{
			mv.setViewName("UserLogin");
			mv.addObject("msg", "Invalid credentials");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/ulogout")
	public String processUlogout(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.removeAttribute("ucheck");
		return "UserLogin";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
