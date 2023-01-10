package kr.or.ddit;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.controller.ManageController;
import kr.or.ddit.domain.Portlet;
import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.service.NoticeBasicService;
import kr.or.ddit.service.PortletService;
import kr.or.ddit.service.QnaService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@PreAuthorize("hasAnyRole('ROLE_STUDENT','ROLE_PROFESSOR','ROLE_MANAGER')")
@Controller
public class HomeController {

	@Autowired
	PortletService portletService;
	@Autowired
	NoticeBasicService noticeBasicService;
	@Autowired
	QnaService qnaService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session,
					   @RequestParam(value = "viewPage", required = false, defaultValue = "1") int viewPage) throws ParseException {
		
		int memNo = (int)session.getAttribute("no");
		
		Portlet memPortlet = this.portletService.memPortlet(memNo);
		
		List<NoticeBasic> noticeBasicList = this.noticeBasicService.noticeBasicSelectAll(1);
		List<Qna> showList = qnaService.showList(viewPage);

        model.addAttribute("qnaList", showList);
        model.addAttribute("noticeBasicList", noticeBasicList);
		model.addAttribute("memPortlet", memPortlet);
		
		return "main/mainPage";
	}
	
	@GetMapping("/main/portlet")
	public String portlet(Model model, HttpSession session) {
		
		int memNo = (int)session.getAttribute("no");
		
		Portlet memPortlet = this.portletService.memPortlet(memNo);
		
		model.addAttribute("memPortlet", memPortlet);
		
		return "main/portlet";
	}
	
	@PostMapping("/updatePortlet")
	@ResponseBody
	public int updatePortlet(@RequestBody Map<String, String> map) {
		
		this.portletService.updatePortlet(map);
		
		return 1;
	}

}
