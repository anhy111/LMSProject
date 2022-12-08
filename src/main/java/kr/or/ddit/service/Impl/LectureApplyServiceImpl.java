package kr.or.ddit.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.mapper.LectureApplyMapper;
import kr.or.ddit.service.LectureApplyService;

@Service
public class LectureApplyServiceImpl implements LectureApplyService {

    @Autowired
    LectureApplyMapper lectureApplyMapper;

    @Override
    public Professor proInfo(int proNo) {
        return this.lectureApplyMapper.proInfo(proNo);
    }

	@Override
	public List<LecApply> getYrNSem(int proNo) {
		return this.lectureApplyMapper.getYrNSem(proNo);
	}
    
	@Override
	public List<LecApply> list(Map<String, Object> map) {
		return this.lectureApplyMapper.list(map);
	}
	
	@Override
	public int getCnt(Map<String, Object> map) {
		return this.lectureApplyMapper.getCnt(map);
	}
    
}
