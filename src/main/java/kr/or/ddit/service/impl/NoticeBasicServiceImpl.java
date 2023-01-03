package kr.or.ddit.service.impl;

import java.util.List;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.mapper.NoticeBasicMapper;
import kr.or.ddit.service.NoticeBasicService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class NoticeBasicServiceImpl implements NoticeBasicService {

    private final NoticeBasicMapper noticeBasicMapper;

    //공지사항 행의 수 조회
    @Override
    public int getNoticeBasicTotalRow() {

        return this.noticeBasicMapper.getNoticeBasicTotalRow();
    }

    @Override
    public int getNoticeBasicTotalRowTitle(String keyword) {
        return this.noticeBasicMapper.getNoticeBasicTotalRowTitle(keyword);
    }

    @Override
    public int getNoticeBasicTotalRowContent(String keyword) {
        return noticeBasicMapper.getNoticeBasicTotalRowContent(keyword);
    }

    //공지사항 목록 조회
    @Override
    public List<NoticeBasic> noticeBasicList(int page) {

        return this.noticeBasicMapper.noticeBasicList(page);
    }

    //공지사항 상세 조회
    @Override
    public NoticeBasic findOne(Long noticeCd) {
        return this.noticeBasicMapper.noticeBasicFindNotice(noticeCd);
    }

    //공지사항 저장
    @Override
    public void noticeBasicSave(NoticeBasic noticeBasic) {
        this.noticeBasicMapper.noticeBasicSave(noticeBasic);
    }

    //공지사항 저장 첨부파일 포함
    @Override
    public void noticeBasicSaveWithAttach(NoticeBasic noticeBasic) {
        this.noticeBasicMapper.noticeBasicSaveWithAttach(noticeBasic);
    }

    //공지사항 수정
    @Override
    public void noticeBasicUpdate(NoticeBasic noticeBasic) {

        this.noticeBasicMapper.noticeBasicUpdate(noticeBasic);
    }

    //공지사항 삭제
    @Override
    public void delete(Long noticeCd) {
        this.noticeBasicMapper.noticeBasicDelete(noticeCd);
    }

    //공지사항 조회수 카운팅
    @Override
    public void updateViewCount(Long noticeCd) {
        this.noticeBasicMapper.noticeBasicUpdateViewCount(noticeCd);
    }

    //공지사항 제목 검색
    @Override
    public List<NoticeBasic> noticeBasicSearchTitle(String keyword) {
        return noticeBasicMapper.noticeBasicSearchTitle(keyword);
    }

    //공지사항 내용 검색
    @Override
    public List<NoticeBasic> noticeBasicSearchContent(String keyword) {
        return noticeBasicMapper.noticeBasicSearchContent(keyword);
    }


}
