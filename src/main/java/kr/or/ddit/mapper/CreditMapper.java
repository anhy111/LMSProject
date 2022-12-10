package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Credit;
import kr.or.ddit.domain.StudentLecture;

public interface CreditMapper {
	public Credit studentCurrentCredit(StudentLecture studentLecture);
}
