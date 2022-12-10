package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FullcalendarController {

    @GetMapping("/full")
    public String full() {
        return "/fullcalendar/fullcalendar";
    }
}

