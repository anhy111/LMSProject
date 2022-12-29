package kr.or.ddit.service;

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

	public Student paymentFormStuInfo(int stuNo);

	public List<Payment> paymentFormInfo(int payCd);

	public List<Department> paymentFormDepInfo(int payCd);


}
