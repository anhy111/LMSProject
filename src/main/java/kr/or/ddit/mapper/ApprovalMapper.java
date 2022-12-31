package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Approval;

public interface ApprovalMapper {

	// 결재 요청 목록
    List<Approval> approvalList(Approval approval);
    
    // 결재 요청
    int insertApproval(Approval approval);
}
