package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Payment;

public interface PaymentService {

	public List<Department>collegeFeeList();

	public List<Payment> adminBillList();

	public int adminBillCount();

	public Payment sumFee();

	public List<Payment> adminPaymentList();


}
