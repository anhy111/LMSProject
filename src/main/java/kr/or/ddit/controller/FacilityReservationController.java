package kr.or.ddit.controller;

import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.facility.FacilityVO;
import kr.or.ddit.domain.facility.ReservationVO;
import kr.or.ddit.service.ReservationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/facility")
@RequiredArgsConstructor
public class FacilityReservationController {

    int result = 0;
    int facility = 0;

    private final ReservationService reservationService;

    @GetMapping("/")
    public String calendar() {

        return "facility/calendar";
    }

    @GetMapping("/full")
    public String full() {

		return "/fullcalendar/fullcalendar";
    }

    //페이지 이동
    @GetMapping("/calendar")
    public String calendar(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Member mem = (Member) session.getAttribute("memSession");
        int memCd = mem.getMemNo();

        List<FacilityVO> facility = reservationService.facility();
        model.addAttribute("facility", facility);

        model.addAttribute("code", memCd);
        return "facility/calendar";
    }


    //과거예약 조회 ajax
    @ResponseBody
    @PostMapping("/historyAjax")
    public List<HashMap<String, Object>> historyAjax(@RequestParam("facCd") int facCd, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Member mem = (Member) session.getAttribute("memSession");
        int memCd = mem.getMemNo();

        ReservationVO vo = new ReservationVO();
        vo.setMemCd(memCd);
        vo.setFacCd(facCd);

        List<HashMap<String, Object>> hashmap = reservationService.history(vo);
        return hashmap;
    }

    //일정가져오기
    @ResponseBody
    @PostMapping("/allcalendar")
    public List<Map<String, Object>> list(@RequestParam("facCd") String facCd, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        Member memVO = (Member) session.getAttribute("memSession");
        int memCd = memVO.getMemNo();

        HashMap<String, Object> hm = new HashMap<String, Object>();

        JSONObject jo;
        JSONArray ja = new JSONArray();

        List<ReservationVO> list = this.reservationService.list(facCd);

        for (ReservationVO vo : list) {

            hm.put("id", vo.getMemCd());
            hm.put("title", "[" + vo.getMemCd() + "] " + vo.getMemNm());
            hm.put("start", vo.getRsvSt());
            hm.put("end", vo.getRsvEn());
            if (vo.getMemCd() == memCd) {
                hm.put("color", "#001353");
            } else {
                hm.put("color", "#BABABA");
            }

            jo = new JSONObject(hm);
            ja.add(jo);
        }

        return ja;
    }

    //등록하기
    @PostMapping("/update")
    @ResponseBody
    public int insert(@RequestBody Map<String, String> param, HttpServletRequest request) {


        HttpSession session = request.getSession();
        Member mem = (Member) session.getAttribute("memSession");
        int memCd = mem.getMemNo();
        System.out.println("멤버코드" + memCd);

        int facCd = Integer.parseInt(param.get("facCd"));
        System.out.println("시설코드" + facCd);
        String rsvSt = (String) param.get("start");
        String rsvEn = (String) param.get("end");

        ReservationVO vo = new ReservationVO();
        vo.setFacCd(facCd);
        vo.setRsvSt(rsvSt);
        vo.setRsvEn(rsvEn);
        vo.setMemCd(memCd);

        result = reservationService.insert(vo);
        System.out.println(result + "결과");

        log.info("voooooooooo" + vo);

        return result;

    }

    //삭제하기
    @DeleteMapping("/update")
    @ResponseBody
    public int delete(@RequestBody Map<String, String> param) {
        int memCd = Integer.parseInt(param.get("memCd"));
        String rsvSt = param.get("rsvSt");
        ReservationVO vo = new ReservationVO();
        vo.setMemCd(memCd);
        vo.setRsvSt(rsvSt);
        result = reservationService.delete(vo);

        return result;
    }

    //수정하기
    @PatchMapping("/update")
    @ResponseBody
    public int modify(@RequestBody Map<String, String> param) {

        String newSt = param.get("newSt"); // 시작 시간
        String newEn = param.get("newEn"); // 끝나는 시간
        String oldSt = param.get("oldSt");
        String memCd = param.get("memCd");

        HashMap<String, Object> hm = new HashMap<String, Object>();
        hm.put("newSt", newSt);
        hm.put("newEn", newEn);
        hm.put("oldSt", oldSt);
        hm.put("memCd", memCd);

        result = reservationService.modify(hm);

        return result;

    }


}
