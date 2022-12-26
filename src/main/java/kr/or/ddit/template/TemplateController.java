package kr.or.ddit.template;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/template")
public class TemplateController {

	@GetMapping("/board")
	public String boardTemplate() {
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
