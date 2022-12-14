package kr.or.ddit.controller;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.service.QnaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
public class QnaController {

    private final QnaService qnaService;

    //QnA 메인 페이지
    @GetMapping("/main")
    public String qnaMain (Model model) {

        int totalRow = this.qnaService.getQnaTotalRow();

       List<Qna> showList = qnaService.showList();

       model.addAttribute("showList", showList);
       model.addAttribute("totalRow", totalRow);

        return "qna/qnaBoard";
    }

    @GetMapping("/qnaWrite")
    public String getQnaWriteForm (Model model) {

        model.addAttribute("form", new QnaForm());

        return "qna/qnaWrite";
    }

    @PostMapping("/qnaWrite")
    public String postQnaWriteForm (QnaForm qnaForm) {

        Qna qna = new Qna(qnaForm.getTitle(), qnaForm.getContent());

        log.info("qnaForm : " + qnaForm.getTitle());

        qnaService.qnaSave(qna);

        return "redirect:main";
    }

    @GetMapping("/qnaDetail/{list.qnaCd}/edit")
    public String detail(@PathVariable("list.qnaCd") Long qnaCd, Model model) {

        // 게시글 아이디를(noticeCd) 통해서 findOne 메서드를 호출하여 조회한다.
        Qna qna = qnaService.findOne(qnaCd);

        // 조회한 NoticeBasic객체를 'form'이라는 이름으로 객체를 전달한다.
        model.addAttribute("form", qna);

        return "qna/qnaDetail";
    }
}
