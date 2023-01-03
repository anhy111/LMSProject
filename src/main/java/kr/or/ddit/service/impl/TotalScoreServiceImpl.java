package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Objection;
import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.TotalScoreMapper;
import kr.or.ddit.service.TotalScoreService;


@Service
public class TotalScoreServiceImpl implements TotalScoreService {

	@Autowired
	TotalScoreMapper TSMapper;
	
	
	//총 건수 세기(성적 받은 건수)
	@Override
	public int getCount(HashMap<String, Object> map) {
		return this.TSMapper.getCount(map);
	}
	@Override
	public int getPreCnt(HashMap<String, Object> map) {
		return this.TSMapper.getPreCnt(map);
	}
	//학생 정보 가져오기
	@Override
	public Student getInfo(String stuNo) {
		return this.TSMapper.getInfo(stuNo);
	}
	
	//년도 및 학기 구하기
	@Override
	public List<LecApply> getYrAndSem(HashMap<String, Object> map) {
		return this.TSMapper.getYrAndSem(map);
	}
	@Override
	public HashMap<String, Object> getNow(){
		return this.TSMapper.getNow();
	}
	
	//성적 불러오기
	@Override
	public List<LecApply> getList(HashMap<String, Object> map){
		return this.TSMapper.getList(map);
	}
	@Override
	public List<LecApply> getPreList(HashMap<String, Object> map){
		return this.TSMapper.getPreList(map);
	}
	//성적 불러오기
	@Override
	public List<LecApply> getListAgain(HashMap<String, Object> map){
		return this.TSMapper.getListAgain(map);
	}
	
	//이수학점 조회
	@Override
	public int getTotalCrd(String stuNo) {
		return this.TSMapper.getTotalCrd(stuNo);
	}
	
	//집계정보 조회
	@Override
	public HashMap<String, Object> getTotalInfo(HashMap<String, Object> map){
		return this.TSMapper.getTotalInfo(map);
	}
	@Override
	public HashMap<String, Object> getPreTotalInfo(HashMap<String, Object> map){
		return this.TSMapper.getPreTotalInfo(map);
	}
	
	//이의신청 여부 확인
	@Override
	public Objection checkObjection(HashMap<String, Object> map) {
		return this.TSMapper.checkObjection(map);
	}
	
	//이의신청 안한 과목 정보 불러오기
	@Override
	public LecApply getCourseInfo(String lecaCd) {
		return this.TSMapper.getCourseInfo(lecaCd);
	}
	//이의신청 insert
	@Override
	public int preAppeal(Objection obj) {
		return this.TSMapper.preAppeal(obj);
	}

	//이의신청 리스트(교수)
	@Override
	public List<Objection> objectionList(String proNo){
		return this.TSMapper.objectionList(proNo);
	}

	//이의신청 상세
	@Override
	public Objection objDetail(String objCd) {
		return this.TSMapper.objDetail(objCd);
	}
	
	//이의신청 승인
	@Override
	public int updateY(Objection obj) {
		return this.TSMapper.updateY(obj);
	}
	
	//이의신청 반려
	@Override
	public int updateN(Objection obj) {
		return this.TSMapper.updateN(obj);
	}
}
