package org.ucalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebController {

	@RequestMapping("/")
	ModelAndView home(ModelAndView modelAndView) {
		
		modelAndView.setViewName("home");
		modelAndView.getModel().put("name", "John");
 
		return modelAndView;
	}
	
	
	
	@RequestMapping(value = "/account.html", method = RequestMethod.GET)
    public ModelAndView handleRequestAccount(HttpServletRequest request,HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView("account");
        return mav;     
    }
	
	@RequestMapping(value = "/accedi.html", method = RequestMethod.GET)
    public ModelAndView handleRequestAccedi(HttpServletRequest request,HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView("accedi");
        return mav;     
    }
	
	
}
