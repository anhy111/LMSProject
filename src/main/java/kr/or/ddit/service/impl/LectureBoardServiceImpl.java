package kr.or.ddit.service.impl;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.mapper.LectureBoardMapper;
import kr.or.ddit.service.LectureBoardService;

@Service
public class LectureBoardServiceImpl implements LectureBoardService{
	@Inject
	LectureBoardMapper lectureBoardMapper;
	
	
	
}
