package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Manager;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public Member read(int memNo) {
		return this.memberMapper.read(memNo);
	}
	
	@Override
	public Student readStudent(int memNo) {
		return this.memberMapper.readStudent(memNo);
	}
	
	@Override
	public Employee	readEmployee(int memNo) {
		return this.memberMapper.readEmployee(memNo);
	}
	
	@Override
	public Manager readManager(int memNo) {
		return this.memberMapper.readManager(memNo);
	}
	
	@Override
	public Professor readProfessor(int memNo) {
		return this.memberMapper.readProfessor(memNo);
	}
	
}
