package kr.or.ddit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Payment;

public interface PaymentMapper {

	// 등록금 목록 조회
	public List<Department> collegeFeeList();

	// 등록금 고지 관리 목록
	public List<Payment> adminBillList();

	// 등록금 고지 관리 리스트 개수
	public int adminBillCount();

	// 등록금 고지 관리 고지서 발송
	public int insert(List<Integer> stuList);
	
	// 등록금 납부 총 납부액
	public Payment sumFee();

	// 등록금 납부 관리 리스트
	public List<Payment> adminPaymentList();

	// 학생 등록금 납부내역 리스트
	public List<Payment> stuPaymentList(int stuNo);

	// 학생 등록금 납부내역 미납자 확인
	public int billCount(int stuNo);

	// 학생 납부확인서
	public HashMap<String, Object> payMentDetail(HashMap<String, Integer> map);

	// 학생 등록금 고지서
	public HashMap<String, Object> payingTuition(int stuNo);

	// 학생 등록금 납부하긔
	public int pay(Map<String, Object> map);
}
