package kr.or.ddit.mapper;

import kr.or.ddit.domain.notice.NoticeBasic;

import java.util.List;

public interface NoticeBasicMapper {

    //공지사항 저장
    void noticeBasicSave(NoticeBasic noticeBasic);

    //공지사항 목록
    List<NoticeBasic> noticeBasicList();

    NoticeBasic noticeBasicFindNotice(Long noticeCd);

    void noticeBasicDelete(Long noticeCd);
}
