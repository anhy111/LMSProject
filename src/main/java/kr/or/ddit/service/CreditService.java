package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Credit;
import kr.or.ddit.domain.StudentLecture;

public interface CreditService {
	public Credit studentCurrentCredit(StudentLecture studentLecture);
}
