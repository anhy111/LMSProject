package kr.or.ddit.controller;

import java.util.List;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.service.NoticeBasicService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.LecNotice;
import kr.or.ddit.service.LecNoticeService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeBasicController {

    private final NoticeBasicService noticeBasicService;

    @GetMapping("/list")
    public String LectureNoticeList(Model model) {
        List<NoticeBasic> noticeBasicList = this.noticeBasicService.NoticeBasicList();

        //공통 약속
        model.addAttribute("bodyTitle","공지사항목록");
        model.addAttribute("noticeBasicList", noticeBasicList);

        //forwarding
        return "notice/list";
    }

    @GetMapping("/add")
    public String add() {

        return "/notice/add";
    }

    @GetMapping("/detail")
    public String detail() {

        return "/notice/detail";
    }

    @GetMapping("/update")
    public String update() {

        return "/notice/update";
    }

}
