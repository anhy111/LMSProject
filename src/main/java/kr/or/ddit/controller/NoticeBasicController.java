package kr.or.ddit.controller;

import java.util.Date;
import java.util.List;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.service.NoticeBasicService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeBasicController {

    private final NoticeBasicService noticeBasicService;

    @GetMapping("/list")
    public String NoticeList(Model model) {

        List<NoticeBasic> noticeBasicList = this.noticeBasicService.noticeBasicList();

        //공통 약속
        model.addAttribute("bodyTitle", "공지사항목록");
        model.addAttribute("noticeBasicList", noticeBasicList);

        //forwarding
        return "notice/list";
    }

    @GetMapping("/noticeForm")
    public String createNoticeForm(Model model) {

        model.addAttribute("form", new NoticeForm());

        return "notice/noticeForm";
    }

    @PostMapping("/noticeForm")
    public String createNotice(NoticeForm form) {

        NoticeBasic noticeBasic = new NoticeBasic(form.getTitle(), form.getContent());

        noticeBasicService.noticeBasicSave(noticeBasic);

        return "redirect:list";
    }

    @GetMapping("/list/{noticeBasic.noticeCd}/edit")
    public String detail(@PathVariable("noticeBasic.noticeCd") Long noticeCd, Model model) {

        NoticeBasic noticeBasic = noticeBasicService.findOne(noticeCd);

        model.addAttribute("form", noticeBasic);

        return "/notice/detail";
    }

    @GetMapping("/update/{form.noticeCd}")
    public String update(@PathVariable("form.noticeCd") Long noticeCd, Model model) {

        NoticeBasic noticeBasic = noticeBasicService.findOne(noticeCd);

        model.addAttribute("form", noticeBasic);

        return "/notice/modifyForm";
    }

    @GetMapping("/delete/{form.noticeCd}")
    public String delete(@PathVariable("form.noticeCd") Long noticeCd) {

        noticeBasicService.delete(noticeCd);

        return "redirect:/notice/list";
    }

}
