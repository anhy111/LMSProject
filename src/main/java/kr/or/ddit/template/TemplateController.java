package kr.or.ddit.template;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.Student;
import kr.or.ddit.service.ManageService;

@Controller
@RequestMapping("/template")
public class TemplateController {

	@Autowired
	ManageService manageService;
	
	@GetMapping("/board")
	public String boardTemplate(Model model) {
		model.addAttribute("bodyTitle","템플릿 타이틀");
		List<Student> list = manageService.studentList();
		model.addAttribute("list",list);
		return "customTemplates 복붙해서 쓰세요/boardTemplate";
	}
	
	@GetMapping("/dataTable")
	public String dataTableTemplate() {
		return "customTemplates 복붙해서 쓰세요/dataTableTemplate";
	}
	
	@GetMapping("/input")
	public String inputTemplate() {
		return "customTemplates 복붙해서 쓰세요/inputTemplate";
	}
}
