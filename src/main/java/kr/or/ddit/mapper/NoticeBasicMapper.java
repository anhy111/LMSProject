package kr.or.ddit.mapper;

import kr.or.ddit.domain.notice.NoticeBasic;

import java.util.List;

public interface NoticeBasicMapper {


    //공지사항 목록 조회
    List<NoticeBasic> noticeBasicList();

    //공지사항 상세 조회
    NoticeBasic noticeBasicFindNotice(Long noticeCd);

    //공지사항 저장
    void noticeBasicSave(NoticeBasic noticeBasic);

    //공지사항 수정
    void noticeBasicUpdate(NoticeBasic noticeBasic);

    //공지사항 삭제
    void noticeBasicDelete(Long noticeCd);


}
