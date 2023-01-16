package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bambooBoard")
public class BambooBoardController {

    @GetMapping("/main")
    public String bambooBoard() {

        return "bambooboard/list";
    }
}
