package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.Member;

public interface MemberMapper  {
	
	//회원 로그인 확인
	public Member read(String memNo);

}
