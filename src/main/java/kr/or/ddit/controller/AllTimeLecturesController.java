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
	public String searchMain(Model model) {
		AllTimeLectures atls = new AllTimeLectures();
		List<AllTimeLectures> atlsList = this.allTimeLecturesService.AllTimeLectrueList(atls);
		model.addAttribute("bodyTitle","역대강의조회");
		model.addAttribute("atlsList", atlsList);
		//forwarding
		return "atls/main";
	}
	
	@ResponseBody
	@PostMapping("/search")
	public List<AllTimeLectures> search(@RequestBody AllTimeLectures atls) {
		
		//검색어 값이 들어오지 않았을 시 null 처리 해줌
		setSearchDataToNull(atls);
		
		log.info("단과대 검색어 : " + atls.getColNm());
		log.info("학과 검색어 : " + atls.getDepNm());
		log.info("과목 검색어 : " + atls.getSubNm());
		log.info("이수구분 : " + atls.getLecaCate());
		log.info("학기구분 : " + atls.getLecaSem());
		log.info("개강유무 : " + atls.getLecYn());
		log.info("교수명 : " + atls.getEmpNm());
		log.info("강의명 : " + atls.getLecaNm());
		List<AllTimeLectures> data = this.allTimeLecturesService.AllTimeLectrueList(atls);
		log.info("서비스 작업 후 데이터 : " + data.toString());
		log.info("검색된 인덱스수 :  " + data.size());
		return data;
	}
	
	// 검색어 값이 들어오지 않았을 시 null 처리 해주는 메소드
	public void setSearchDataToNull(AllTimeLectures atls) {
		
				if(atls.getColNm().equals("단과대검색어")) {atls.setColNm("");}
				if(atls.getDepNm().equals("학과검색어")) {atls.setDepNm("");}
				if(atls.getSubNm().equals("과목검색어")) {atls.setSubNm("");}
				if(atls.getLecaCate().equals("이수구분")) {atls.setLecaCate("");}
				if(atls.getLecaSem().equals("학기구분")) {atls.setLecaSem("");}
				if(atls.getLecYn().equals("개강유무")) {atls.setLecYn("");}
				if(atls.getEmpNm().equals("교수/강의명")) {atls.setEmpNm("");}	//교수명
				if(atls.getLecaNm().equals("교수/강의명")) {atls.setLecaNm("");}//강의명
	}
}
