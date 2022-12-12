package kr.or.ddit.service.Impl;

import kr.or.ddit.domain.qna.NotificationVO;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final NotificationMapper notificationMapper;

    // 읽지 않은 알림
    @Override
    public List<NotificationVO> getNotification(int memCd) {
        return this.notificationMapper.getNotification(memCd);
    }

    // 알림 읽음 처리
    @Override
    public int updateNtfYn(int ntfCd) {
        return this.notificationMapper.updateNtfYn(ntfCd);
    }

    /**
     * 알림 추가
     */
    @Override
    public int insertNtf(Map<String, Object> map) {
        return this.notificationMapper.insertNtf(map);
    }

}
