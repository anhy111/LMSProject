package kr.or.ddit.mapper;

import kr.or.ddit.domain.GraduateCredit;

public interface GraduateCreditMapper {
	GraduateCredit studentApplyMaxCredit(String stuNo);
}
