package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Student;

public interface ApprovalService {

	//결제 요청 목록
    List<Approval> approvalList(Approval approval);

    // 결재 요청
    int insertApproval(Approval approval);
    
    // 결재 삭제
    int deleteApproval(Approval approval);
    
    // 결재 승인상태 변경
    int updateApproval(Approval approval);
    
	// 장학생 추천 결재 디테일
    Student schStuDetail(Approval approval);
    
    // 총 데이터 수
    int approvalListPaging(Approval approval);
}
