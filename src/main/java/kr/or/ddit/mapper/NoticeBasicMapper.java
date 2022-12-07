package kr.or.ddit.mapper;

import kr.or.ddit.domain.notice.NoticeBasic;

import java.util.List;

public interface NoticeBasicMapper {

    //공지사항 목록
    public List<NoticeBasic> NoticeBasicList();
}
