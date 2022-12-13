package kr.or.ddit.controller;

import kr.or.ddit.domain.facility.MemberVO;
import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.domain.qna.QnaVO;
import kr.or.ddit.service.QnaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
public class QnaController {

    private final QnaService qnaService;

    //QnA 메인 페이지
    @GetMapping("/main")
    public String qnaMain (Model model) {

       List<Qna> showList = qnaService.showList();

       model.addAttribute("showList", showList);

        return "qna/qnaBoard";
    }

    @GetMapping("/qnaWrite")
    public String getQnaWriteForm (Model model) {

        model.addAttribute("form", new QnaForm());

        return "qna/qnaWrite";
    }

    @PostMapping("/qnaWrite")
    public String postQnaWriteForm (QnaForm qnaForm) {

        Qna qna = new Qna(qnaForm.getTitle(), qnaForm.getContent(), qnaForm.getAccessNumber());

        qnaService.qnaSave(qna);

        return "redirect:main";
    }

    @ResponseBody
    @PostMapping("/qnaWriteAction")
    public int qnaWriteAction (String title, String content, int isShow, HttpServletRequest request) {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
        int memCd = memberVO.getMemCd();

        HashMap<String, Object> map = new HashMap<String, Object>();

        map.put("memCd", memCd);
        map.put("qnaTtl", title);
        map.put("qnaCon", content);
        map.put("qnaYn", isShow);

        int res = qnaService.insertQuestion(map);

        return res;
    }


    @RequestMapping("/qnaDetail")
    public String qnaDetail(
            Model model, QnaVO qnaVO
    ) {

        HashMap<String, Object> map = new HashMap<String, Object>();

        map.put("qnaCd", qnaVO.getQnaCd());
        map.put("memCd", qnaVO.getMemCd());

        //QnaVO qnaVO_ = new QnaVO();
        qnaVO = this.qnaService.detail(map);

        model.addAttribute("qnaVO", qnaVO);


        return "qna/qnaDetail";

    }


    @ResponseBody
    @PostMapping("/qnarWrite")
    public int qnarWrite(String reply, int qnaCd, int memCd) {

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("qnaCd", qnaCd);
        map.put("qnarCon", reply);

        int res = qnaService.qnarWrite(map);

        List<Integer> memList = new ArrayList<Integer>();
        memList.add(memCd);

//		Map<String, Object> noticeMap = new HashMap<String, Object>();
//		noticeMap.put("ntfCon", " 문의 답변이 도착했습니다.");
//		noticeMap.put("memList", memList);
//		noticeMap.put("ntfUrl", "/qna/qnaDetail?qnaCd=" + qnaCd + "&memCd=" + memCd);
//		this.notificationService.insertNtf(noticeMap);

        return res;
    }


    @PostMapping("/replyUpdate")
    @ResponseBody
    public int replyUpdate(int qnaCd, String qnarCon) {

        HashMap<String, Object> map = new HashMap<String, Object>();

        map.put("qnaCd", qnaCd);
        map.put("qnarCon", qnarCon);

        int res = qnaService.updateRepl(map);

        return res;
    }


    @PostMapping("/qnaUpdate")
    @ResponseBody
    public int qnaUpdate(int qnaCd, String title, String content) {

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("qnaCd", qnaCd);
        map.put("qnaTtl", title);
        map.put("qnaCon", content);
        int res = qnaService.updateQ(map);

        return res;
    }

    @PostMapping("/qnaDelete")
    @ResponseBody
    public int qnaDelete(int qnaCd) {
        int res = qnaService.deleteQ(qnaCd);
        return res;
    }

}
