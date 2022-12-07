package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.service.NoticeBasicService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.LecNotice;
import kr.or.ddit.service.LecNoticeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    @GetMapping("/noticeForm")
    public String getNoticeForm(Model model) {

        model.addAttribute("form", new NoticeForm());

        return "notice/noticeForm";
    }

    @PostMapping("/noticeForm")
    public String postNoticeForm(NoticeForm form) {

        NoticeBasic noticeBasic = new NoticeBasic();

        noticeBasic.setNoticeTtl(form.getTitle());
        noticeBasic.setNoticeCon(form.getContent());
        noticeBasic.setNoticeReg(new Date());
        noticeBasic.setNoticeUpd(new Date());

        //         noticeService.saveNotice(noticeBasic);

        return "redirect:notice/list";
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
