package org.ucalproject.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApiController {

	
	@RequestMapping("/api/getBalance")
	
		public ResponseEntity<?> getBalance(
	            @RequestBody String address, Errors errors) {

	       

	        return ResponseEntity.ok(new String ("3.78690"));

	    }
	
	
	
}
