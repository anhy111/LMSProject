package kr.or.ddit;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.ManageController;
import kr.or.ddit.service.PortletService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_PROFESSOR','ROLE_MANAGER')")
@Controller
public class HomeController {

	@Autowired
	PortletService portletService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "main/mainPage";
	}
	
	@PostMapping("/updatePortlet")
	@ResponseBody
	public int updatePortlet(@RequestBody Map<String, String> map) {
		
		this.portletService.updatePortlet(map);
		
		return 1;
	}

}
