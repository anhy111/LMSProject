package kr.or.ddit.controller;

import java.util.List;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.service.NoticeBasicService;
import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor // 어노테이션이 궁금하면 생성자 주입과 관련해서 찾아보시길..!
public class NoticeBasicController {

    /**
     *     DI(의존성 주입)을 하는 방법에는 3가지가 있다.
     *     1) 필드 주입
     *     2) 수정자(Setter) 주입
     *     3) 생성자 주입
     *
     *     이 중 3) 생성자 주입을 쓸 것을 Spring 에서 권장한다.
     *     장/단점이 궁금하면 슬랙으로..ㅎ
     */

    private final NoticeBasicService noticeBasicService; // final을 붙인 이유: 생성시 초기값을 꼭 넣어줘야 함!

    //공지사항 리스트
    @GetMapping("/list")
    public String noticeList(Model model) {

        int totalRow = this.noticeBasicService.getNoticeBasicTotalRow();

        List<NoticeBasic> noticeBasicList = this.noticeBasicService.noticeBasicList();

        //공통 약속
        model.addAttribute("bodyTitle", "공지사항목록");
        model.addAttribute("noticeBasicList", noticeBasicList);
        model.addAttribute("totalRow", totalRow);

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

        log.info(noticeBasic.toString());

        // NoticeBasic객체를 save메서드를 호출하여, 서비스로직 실행.
        noticeBasicService.noticeBasicSave(noticeBasic);

        return "redirect:list";
    }

    //공지사항 상세페이지
    @GetMapping("/list/{noticeBasic.noticeCd}/detail")
    public String detail(@PathVariable("noticeBasic.noticeCd") Long noticeCd, Model model) {

        // 게시글 아이디를(noticeCd) 통해서 findOne 메서드를 호출하여 조회한다.
        NoticeBasic noticeBasic = noticeBasicService.findOne(noticeCd);

        // 조회한 NoticeBasic객체를 'form'이라는 이름으로 객체를 전달한다.
        model.addAttribute("form", noticeBasic);

        return "notice/detail";
    }

    //공지사항 수정페이지
    @GetMapping("/update/{form.noticeCd}")
    public String updateForm(@PathVariable("form.noticeCd") Long noticeCd, Model model) {

        NoticeBasic noticeBasic = noticeBasicService.findOne(noticeCd);

        model.addAttribute("form", noticeBasic);

        return "notice/modifyForm";
    }

    @PostMapping("/update/{form.noticeCd}")
    public String updateNotice(@ModelAttribute("form") NoticeBasic form) {

        noticeBasicService.noticeBasicUpdate(form);

        return "redirect:/notice/list";
    }

    //공지사항 삭제
    @GetMapping("/delete/{form.noticeCd}")
    public String delete(@PathVariable("form.noticeCd") Long noticeCd) {

        noticeBasicService.delete(noticeCd);

        return "redirect:/notice/list";
    }

    @GetMapping("/upload")
    public String uploadView() {

        return "json/fileInput";
    }

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes) {

        // 파일을 저장하거나 처리합니다.

        redirectAttributes.addFlashAttribute("message",
                "You successfully uploaded " + file.getOriginalFilename() + "!");

        return "redirect:/notice/list";
    }

    @GetMapping("/json/index")
    public String jsonIndex() {

        return "json/index";
    }

}
