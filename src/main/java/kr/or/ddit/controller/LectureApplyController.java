package kr.or.ddit.controller;

import kr.or.ddit.service.LectureApplyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/professor/lectureApply")
public class LectureApplyController {
    @GetMapping("/main")
    public String list() {
        return "professor/lectureApply/main";
    }

//    @Autowired
//    private LectureApplyService lectureApplyService;


}
