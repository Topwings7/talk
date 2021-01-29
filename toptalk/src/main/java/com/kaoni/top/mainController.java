package com.kaoni.top;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class mainController {
	
	public static List<Integer> roomList = new ArrayList<Integer>();
	
	@GetMapping(value = "/")
	public String main() {
		return "main";
	}
	
	@GetMapping(value ="watingRoom")
	public String watingRoom(@RequestParam String id, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
			session.setAttribute("id", id);
		model.addAttribute("roomList", roomList);
		return "watingRoom";
	}
	
	@GetMapping(value = "createRoom")
	public String createRoom(@RequestParam String id) {
		int target = roomList.size();    
		roomList.add(++target);
		return "forward:/watingRoom?id="+id;
	}
	@GetMapping(value = "deleteRoom")
	public String deleteRoom(@RequestParam int roomNumber, @RequestParam String id) {
		roomList.remove(--roomNumber);
		return "forward:/watingRoom?id="+id;                         
	}
	@GetMapping(value = "enterRoom")
	public String chatRoom() {
		return "chat";
	}
}
