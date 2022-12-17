package EvaluationServiceImpl.java;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.LecNotice;
import kr.or.ddit.mapper.LecNoticeMapper;
import kr.or.ddit.service.LecNoticeService;

@Service
public class LecNoticeServiceImpl implements LecNoticeService{

	@Autowired
	LecNoticeMapper lectureNoticeMapper;

	//공지사항 목록
	@Override
	public List<LecNotice> LectureNoticeList(){
		return this.lectureNoticeMapper.LectureNoticeList();
	}
}
