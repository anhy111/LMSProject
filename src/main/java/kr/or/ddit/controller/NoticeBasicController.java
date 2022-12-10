package kr.or.ddit.controller;

import java.util.Date;
import java.util.List;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.service.NoticeBasicService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeBasicController {

    private final NoticeBasicService noticeBasicService;

    //공지사항 리스트
    @GetMapping("/list")
    public String NoticeList(Model model) {

        List<NoticeBasic> noticeBasicList = this.noticeBasicService.noticeBasicList();

        //공통 약속
        model.addAttribute("bodyTitle", "공지사항목록");
        model.addAttribute("noticeBasicList", noticeBasicList);

        //forwarding
        return "notice/list";
    }

    //공지사항 등록 폼
    @GetMapping("/noticeForm")
    public String createNoticeForm(Model model) {

        // 공지사항 등록을 위한 폼(제목, 내용)을 전달.
        model.addAttribute("form", new NoticeForm());

        return "notice/noticeForm";
    }

    //공지사항 등록(Save)
    @PostMapping("/noticeForm")
    public String createNotice(NoticeForm form) {

        // 공지사항 등록을 위한 폼(제목, 내용)에 담아온 값을 꺼내어, NoticeBasic객체에 생성자로 세팅해준다. Setter로 값을 넣어주는 방법은 지양하는게 좋다.
        NoticeBasic noticeBasic = new NoticeBasic(form.getTitle(), form.getContent());

        // NoticeBasic객체를 save메서드를 호출하여, 서비스로직 실행.
        noticeBasicService.noticeBasicSave(noticeBasic);

        return "redirect:list";
    }

    //공지사항 상세페이지
    @GetMapping("/list/{noticeBasic.noticeCd}/edit")
    public String detail(@PathVariable("noticeBasic.noticeCd") Long noticeCd, Model model) {

        // 게시글 아이디를(noticeCd) 통해서 findOne 메서드를 호출하여 조회한다.
        NoticeBasic noticeBasic = noticeBasicService.findOne(noticeCd);

        // 조회한 NoticeBasic객체를 'form'이라는 이름으로 객체를 전달한다.
        model.addAttribute("form", noticeBasic);

        return "/notice/detail";
    }

    //공지사항 수정페이지
    @GetMapping("/update/{form.noticeCd}")
    public String updateForm(@PathVariable("form.noticeCd") Long noticeCd, Model model) {

        NoticeBasic noticeBasic = noticeBasicService.findOne(noticeCd);

        model.addAttribute("form", noticeBasic);

        return "/notice/modifyForm";
    }

    @PostMapping("/update/{form.noticeCd}")
    public String updateNotice(@ModelAttribute("form") NoticeBasic form) {



        noticeBasicService.noticeBasicUpdate(form);
        System.out.println(form.getNoticeTtl() + form.getNoticeCon());

        return "redirect:/notice/list";
    }

    //공지사항 삭제
    @GetMapping("/delete/{form.noticeCd}")
    public String delete(@PathVariable("form.noticeCd") Long noticeCd) {

        noticeBasicService.delete(noticeCd);

        return "redirect:/notice/list";
    }
}
