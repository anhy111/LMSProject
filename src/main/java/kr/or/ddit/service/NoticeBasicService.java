package kr.or.ddit.service;

import kr.or.ddit.domain.notice.NoticeBasic;

import java.util.List;


public interface NoticeBasicService {

    //공지사항 전체 행의 수 조회
    int getNoticeBasicTotalRow();

    int getNoticeBasicTotalRowTitle(String title);

    int getNoticeBasicTotalRowContent(String content);



    //공지사항 목록 조회
    List<NoticeBasic> noticeBasicList(int page);

    //공지사항 상제 조회
    NoticeBasic findOne(Long noticeCd);

    //공지사항 추가
    void noticeBasicSave(NoticeBasic noticeBasic);

    //공지사항 수정
    void noticeBasicUpdate(NoticeBasic noticeBasic);

    //공지사항 삭제
    void delete(Long noticeCd);

    void updateViewCount(Long noticeCd);

    List<NoticeBasic> noticeBasicSearchTitle(String keyword);

    List<NoticeBasic> noticeBasicSearchContent(String keyword);

    void noticeBasicSaveWithAttach(NoticeBasic noticeBasic);
}
