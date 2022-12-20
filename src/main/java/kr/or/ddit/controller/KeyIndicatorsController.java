package kr.or.ddit.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ketIndicators")
@Controller
public class KeyIndicatorsController {

	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@GetMapping("/chart")
	public String charts(Model model) {
		return "chart/keyIndicators";
	}
}
