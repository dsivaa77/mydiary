package com.spring.mydiary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mydiary.entity.Entry;
import com.spring.mydiary.entity.User;
import com.spring.mydiary.service.EntryService;
import com.spring.mydiary.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
public class HomeController 
{
	@Autowired
	private UserService userService;
	@Autowired
	private EntryService entryService;
	@Autowired
	HttpSession session;
	@GetMapping("home")
	public String home()
	{
		String model=new String("loginpage");
		return model;
	}
	@GetMapping("register")
	public String register()
	{
		String model=new String("registrationpage");
		return model;
	}
	@PostMapping(value="saveuser")
	public String saveUser(@ModelAttribute("user") User user)
	{
		userService.saveUser(user);
		String model=new String("registrationSuccessful");
		return model;
		
	}
	@PostMapping(value="authenticate")
	public String authenticateUser(@ModelAttribute("user") User user, Model model)
	{
		String viewName=new String("loginpage");
		User user1=userService.findByUsername(user.getUsername());
		if(user1!=null && user.getPassword().equals(user1.getPassword()))
		{
			viewName="userhomepage";
			model.addAttribute("user", user1);
			session.setAttribute("user", user1);
			List<Entry> entries=null;
			try {
				entries=entryService.findByUserId(user1.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("entrylist",entries);
		}
		return viewName;
	}
	@GetMapping("addentry")
	public String addEntry()
	{
		String model=new String("addentryform");
		
		return model;
	}
	@PostMapping(value="saveentry")
	public String saveentry(@ModelAttribute("entry") Entry entry,Model model)
	{
		String viewName=new String("userhomepage");
		entryService.saveEntry(entry);
		User user1=(User) session.getAttribute("user");
		List<Entry> entries=null;
		try {
			entries=entryService.findByUserId(user1.getId());
		} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("entrylist",entries);
		return viewName;
	}
	@GetMapping("viewentry")
	public String viewEntry(@RequestParam("id") int id,Model model)
	{
		String viewName=new String("displayentry");
		Entry entry=entryService.findById(id);
		model.addAttribute("entry",entry);
		return viewName;
		
	}
	@GetMapping("userhome")
	public String userHomePage(Model model)
	{
		String viewName=new String("userhomepage");
		User user1=(User) session.getAttribute("user");
		List<Entry> entries=null;
		try {
			entries=entryService.findByUserId(user1.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("entrylist",entries);
		return viewName;
		
	}
	@GetMapping("updateentry")
	public String updateEntry(@RequestParam("id") int id,Model model)
	{
		String viewName=new String("displayupdateentry");
		User user1=(User) session.getAttribute("user");
		if(user1==null)
			viewName="loginpage";
		Entry entry=entryService.findById(id);
		model.addAttribute(entry);
		return viewName;
	}
	@PostMapping(value="processupdateentry")
	public String processUpdateEntry(@ModelAttribute("entry") Entry entry,Model model)
	{
		String viewName=new String("userhomepage");
		entryService.updateEntry(entry);
		User user1=(User) session.getAttribute("user");
		List<Entry> entries=null;
		try {
			entries=entryService.findByUserId(user1.getId());
		} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("entrylist",entries);
		return viewName;
	}
	@GetMapping("deleteentry")
	public String deleteEntry(@RequestParam("id") int id,Model model)
	{
		String viewName=new String("userhomepage");
		Entry entry=entryService.findById(id);
		User user1=(User) session.getAttribute("user");
		if(user1==null)
			viewName="loginpage";
		else
			entryService.deleteEntry(entry);
		List<Entry> entries=null;
		try {
			entries=entryService.findByUserId(user1.getId());
		} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("entrylist",entries);
		return viewName;
	}
	@GetMapping("signout")
	public String signOut()
	{
		String model=new String("loginpage");
		session.invalidate();
		return model;
	}
}

