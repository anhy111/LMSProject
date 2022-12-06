package kr.or.ddit.service.Impl;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.mapper.LectureApplyMapper;
import kr.or.ddit.service.LectureApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureApplyServiceImpl implements LectureApplyService {

    @Autowired
    LectureApplyMapper lectureApplyMapper;

    @Override
    public List<LecApply> list() {
        return this.lectureApplyMapper.list();
    }
}
