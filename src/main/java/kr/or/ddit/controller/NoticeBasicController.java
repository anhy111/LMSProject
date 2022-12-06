package kr.or.ddit.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.domain.LecNotice;
import kr.or.ddit.service.LecNoticeService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeBasicController {

    private final LecNoticeService lecNoticeService;

    @GetMapping("/add")
    public String add() {

        return "/notice/add";
    }

    @GetMapping("/detail")
    public String detail() {

        return "/notice/detail";
    }

    @GetMapping("/update")
    public String update() {

        return "/notice/update";
    }

}