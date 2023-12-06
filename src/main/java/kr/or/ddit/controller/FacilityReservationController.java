package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.domain.facility.Facility;
import kr.or.ddit.domain.facility.FacilityScheduleVO;
import kr.or.ddit.service.FacilityMemberService;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/facility")
@PreAuthorize("hasAnyRole('ROLE_PROFESSOR', 'ROLE_STUDENT', 'ROLE_MANAGER')")
public class FacilityReservationController {

    private final FacilityMemberService facilityMemberService;
    private static final Integer SUCCESS = 1;


    @GetMapping("/full")
    public String fullGet(Principal principal, HttpServletRequest request, Model model) {
        if (principal == null) {
            return "redirect:/";
        }
        String id = principal.getName();
        HttpSession session = request.getSession();
        session.setAttribute("memNo", id);

        List<Facility> facility = facilityMemberService.facility();
        model.addAttribute("facility", facility);
        model.addAttribute("memberNumber", id);

        return "facility/full";
    }

    @ResponseBody
    @PostMapping("/full")
    public List<FacilityScheduleVO> fullPost(@RequestParam("facCd") int facCd) {
    	
        return facilityMemberService.listSch(facCd);
    }

    @ResponseBody
    @PostMapping("/insertSch")
    public int insertSch (@RequestBody FacilityScheduleVO facilityScheduleVO) {
    	log.info("facCd: " + facilityScheduleVO.getFacCd());
        log.info("facilityScheduleVO: {}", facilityScheduleVO);
        facilityMemberService.insertSch(facilityScheduleVO);

        return facilityScheduleVO.getRsvCd();
    }

    @ResponseBody
    @PostMapping("/deleteSch")
    public int deleteSch (@RequestBody FacilityScheduleVO facilityScheduleVO) {
        log.info("facilityScheduleVO: {}", facilityScheduleVO);
        facilityMemberService.deleteSch(facilityScheduleVO);

        return SUCCESS;
    }


}
