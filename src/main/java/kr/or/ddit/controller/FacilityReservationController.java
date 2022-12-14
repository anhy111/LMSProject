package kr.or.ddit.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.domain.facility.FacilityScheduleVO;
import kr.or.ddit.service.FacilityMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
public class FacilityReservationController {

    private final FacilityMemberService facilityMemberService;
    private static final Integer SUCCESS = 1;

    @GetMapping("/facility/full")
    public String fullGet(Principal principal, HttpServletRequest request) {

        String id = principal.getName();
        HttpSession session = request.getSession();
        session.setAttribute("memNo", id);

        return "facility/full";

    }

    @ResponseBody
    @PostMapping("/facility/full")
    public List<FacilityScheduleVO> fullPost() {
        List<FacilityScheduleVO> list = facilityMemberService.listSch();
        return list;
    }

    @ResponseBody
    @PostMapping("/facility/insertSch")
    public int insertSch (@RequestBody FacilityScheduleVO facilityScheduleVO) {
        facilityMemberService.insertSch(facilityScheduleVO);

        return SUCCESS;
    }

    @ResponseBody
    @PostMapping("/facility/deleteSch")
    public int deleteSch (@RequestBody FacilityScheduleVO facilityScheduleVO) {

        facilityMemberService.deleteSch(facilityScheduleVO);

        return SUCCESS;
    }

    @GetMapping("/facility/login")
    public String login() {

        return "test/home";
    }
}
