package kr.or.ddit.service.impl;

import java.util.List;

import kr.or.ddit.domain.notice.NoticeBasic;
import kr.or.ddit.mapper.NoticeBasicMapper;
import kr.or.ddit.service.NoticeBasicService;
import lombok.RequiredArgsConstructor;
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

    //공지사항 목록 조회
    @Override
    public List<NoticeBasic> noticeBasicList() {

        return this.noticeBasicMapper.noticeBasicList();
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
}
