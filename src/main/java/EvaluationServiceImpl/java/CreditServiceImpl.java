package EvaluationServiceImpl.java;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Credit;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.mapper.CreditMapper;
import kr.or.ddit.service.CreditService;

@Service
public class CreditServiceImpl  implements CreditService{
	
	@Autowired
	CreditMapper creditMapper;
	
	@Override
	public Credit studentCurrentCredit(StudentLecture studentLecture) {
		return this.creditMapper.studentCurrentCredit(studentLecture);
	}
}
