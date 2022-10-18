package com.triplethreat.sidewalksale.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.triplethreat.sidewalksale.models.Category;
import com.triplethreat.sidewalksale.models.Product;
import com.triplethreat.sidewalksale.services.CategoryService;
import com.triplethreat.sidewalksale.services.ProductService;
import com.triplethreat.sidewalksale.services.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userServ;
	@Autowired
	private ProductService productServ;
	@Autowired
	private CategoryService categoryServ;
	
	
	@GetMapping("/dashboard")
    public String dashboard(HttpSession session,Model model) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/logout";
		}
		
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.findById(userId));
		List<Product> products= productServ.allProducts();
		List<Category> categories= categoryServ.allCategories();
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
    	return "dashboard.jsp";
    }
}
