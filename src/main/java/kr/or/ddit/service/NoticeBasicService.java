package kr.or.ddit.service;

import kr.or.ddit.domain.notice.NoticeBasic;

import java.util.List;

public interface NoticeBasicService {

    //공지사항 목록
    public List<NoticeBasic> NoticeBasicList();
}
