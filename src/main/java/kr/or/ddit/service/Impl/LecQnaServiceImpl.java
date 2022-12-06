package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.LecQna;
import kr.or.ddit.mapper.LecQnaMapper;
import kr.or.ddit.service.LecQnaService;

@Service
public class LecQnaServiceImpl implements LecQnaService {
	
	@Autowired
	LecQnaMapper lecQnaMapper;
	
	//질문 게시판 목록
	@Override
	public List<LecQna> LecQnaList(){
		return this.lecQnaMapper.LecQnaList();
	}
}
