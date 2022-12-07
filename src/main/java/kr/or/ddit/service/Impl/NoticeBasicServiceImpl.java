package kr.or.ddit.service.Impl;

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

    //공지사항 목록
    @Override
    public List<NoticeBasic> NoticeBasicList() {
        return this.noticeBasicMapper.NoticeBasicList();
    }
}
