package kr.or.ddit.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    
    
}
