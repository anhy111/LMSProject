package kr.or.ddit.controller;

import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.domain.qna.qnareply.QnaReply;
import kr.or.ddit.service.QnaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
public class QnaController {

    private final QnaService qnaService;

    private static final String REDIRECT_MAIN = "redirect:/qna/main";
    private static final String VIEWS_QNA_MAIN = "qna/test";
    private static final String VIEWS_QNA_DETAIL = "qna/qnaDetail";

    //QnA 메인 페이지
    @GetMapping("/main")
    public String qna(Model model,
                      @RequestParam(value = "viewPage", required = false, defaultValue = "1") int viewPage) {

        // 총 행의 수 조회
        int totalRow = this.qnaService.getQnaTotalRow();

        //총 페이지의 수 계산
        int totalPage = (int) Math.ceil((double) totalRow / 10);

        // 목록 조회
        List<Qna> showList = qnaService.showList(viewPage);

        model.addAttribute("qnaList", showList);
        model.addAttribute("totalRow", totalRow);
        model.addAttribute("totalPage", totalPage);

        return VIEWS_QNA_MAIN;
    }

    @GetMapping("/qnaWrite")
    public String getQnaWriteForm(Principal principal, HttpServletRequest request, Model model) {

        Long id = Long.valueOf(principal.getName());

        model.addAttribute("form", new QnaForm());
        model.addAttribute("memberNumber", id);

        return "qna/qnaWrite";
    }

    @PostMapping("/qnaWrite")
    public String postQnaWriteForm(@ModelAttribute("qnaForm") QnaForm qnaForm) {
        Qna qna = new Qna(qnaForm.getMemberNumber(), qnaForm.getTitle(), qnaForm.getContent());



        qnaService.qnaSave(qna);

        return REDIRECT_MAIN;
    }

    @GetMapping("/qnaDetail/{list.qnaCd}/detail")
    public String detail(@PathVariable("list.qnaCd") Long qnaCd, Model model) {

        //조회수++
        qnaService.updateViewCount(qnaCd);



        // 게시글 아이디를(noticeCd) 통해서 findOne 메서드를 호출하여 조회한다.
        Qna qna = qnaService.findOne(qnaCd);

        // 댓글 조회
        QnaReply qnaReply = qnaService.findReplyOne(qnaCd);
        model.addAttribute("qnaReply", qnaReply);
        // 조회한 NoticeBasic객체를 'form'이라는 이름으로 객체를 전달한다.
        model.addAttribute("form", qna);

        return VIEWS_QNA_DETAIL;
    }

    //공지사항 수정페이지
    @GetMapping("/update/{form.noticeCd}")
    public String updateForm(@PathVariable("form.noticeCd") Long qnaCd, Model model) {

        Qna qna = qnaService.findOne(qnaCd);

        model.addAttribute("form", qna);

        return "qna/qnaModifyForm";
    }

    @PostMapping("/update/{form.qnaCd}")
    public String updateQna(@ModelAttribute("form") Qna form) {

        qnaService.update(form);

        return REDIRECT_MAIN;
    }

    //공지사항 삭제

    @GetMapping("/delete/{form.qnaCd}")
    public String deleteQna(@PathVariable("form.qnaCd") Long qnaCd) {

        qnaService.delete(qnaCd);

        return REDIRECT_MAIN;
    }

    @PostMapping("/qnaDetail/{form.qnaCd}/addReply")
    public String addReply(@RequestParam("parentId") Long parentId,
                           @RequestParam("content") String content) {

        QnaReply qnaReply = new QnaReply(parentId, content);

        qnaService.qnaReplySave(qnaReply);

        return "redirect:/qna/qnaDetail/" + parentId + "/detail";
    }

}
