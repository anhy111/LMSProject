package kr.or.ddit.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Payment;
import kr.or.ddit.domain.Student;

public interface PaymentService {

	public List<Department>collegeFeeList();

	public List<Payment> adminBillList();

	public int adminBillCount();

	public Payment sumFee();

	public List<Payment> adminPaymentList();

	public List<Payment> stuPaymentList(int stuNo);

	public int billCount(int stuNo);

	public HashMap<String,Object> payMentDetail(HashMap<String,Integer>map);

	public HashMap<String, Object> payingTuition(int stuNo);

}
