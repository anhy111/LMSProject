package kr.or.ddit.service;

import kr.or.ddit.domain.notice.Notice;
import kr.or.ddit.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeRepository noticeRepository;

    @Transactional
    public void saveNotice(Notice notice) {
        noticeRepository.save(notice);
    }

    @Transactional
    public void updateNotice(Long noticeId, String name, int price, int stockQuantity) {

        // DTO를 만들어서 넣으면 됨.
        Notice findNotice = noticeRepository.findOne(noticeId);
        findNotice.change(name, price, stockQuantity);
    }

    public List<Notice> findNotices() {
        return noticeRepository.findAll();
    }

    public Notice findOne(Long noticeId) {
        return noticeRepository.findOne(noticeId);
    }
}
