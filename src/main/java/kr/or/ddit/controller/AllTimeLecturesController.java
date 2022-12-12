package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.AllTimeLectures;
import kr.or.ddit.domain.College;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.service.AllTimeLecturesService;
import kr.or.ddit.service.Impl.AllTimeLecturesServiceImpl;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/atls")
public class AllTimeLecturesController {
	@Autowired
	AllTimeLecturesService allTimeLecturesService;
	
	@GetMapping("/main")
	public String Inquiry(Model model) {
		AllTimeLectures atls = new AllTimeLectures();
		List<AllTimeLectures> atlsList = this.allTimeLecturesService.AllTimeLectrueList(atls);
		model.addAttribute("bodyTitle","역대강의조회");
		model.addAttribute("atlsList", atlsList);
		//forwarding
		return "atls/main";
	}
	
	@ResponseBody
	@PostMapping("/search")
	public List<AllTimeLectures> search(@RequestBody AllTimeLectures atls, Model model) {
//		String colNmData = colNm.get("colNm");
//		log.info("파라미터 넘어와서 키로 밸류 꺼낸 값 : " + colNmData); 
		List<AllTimeLectures> data = this.allTimeLecturesService.AllTimeLectrueList(atls);
		log.info("data : " + data.toString());
		return data;
		
	
	}
}
