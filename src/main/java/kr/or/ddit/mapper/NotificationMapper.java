package kr.or.ddit.mapper;

import kr.or.ddit.domain.qna.NotificationVO;

import java.util.List;
import java.util.Map;

public interface NotificationMapper {
	// 읽지 않은 알림
    List<NotificationVO> getNotification(int memCd);

	// 알림 읽음 처리
    int updateNtfYn(int ntfCd);

	/**
	 * 알림 추가
	 * @param map
	 * @return
	 */
    int insertNtf(Map<String, Object> map);
}
