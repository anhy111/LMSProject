package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.College;
import kr.or.ddit.domain.Department;

public interface CollegeService {

	//단과대학 목록
    List<College> CollegeList();
	//단과대학 상세
    College CollegeDetail(int colCd);
	//단과대학 수정
    int CollegeUpdate(College college);
	//단과대학 정보 삭제
    int CollegeDelete(int colCd);
	//단과대학 등록
    int CollegeRegist(College college);
	//단과대학별 학과 조회
    List<Department> DepartmentByCollegeList(int colCd);

}
