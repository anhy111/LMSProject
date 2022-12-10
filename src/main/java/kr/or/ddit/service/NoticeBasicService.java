package kr.or.ddit.service;

import kr.or.ddit.domain.notice.NoticeBasic;

import java.util.List;

public interface NoticeBasicService {

    //공지사항 추가
    void noticeBasicSave(NoticeBasic noticeBasic);

    //공지사항 목록
    List<NoticeBasic> noticeBasicList();

    NoticeBasic findOne(Long noticeCd);

    void delete(Long noticeCd);
}
