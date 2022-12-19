package kr.or.ddit.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.service.LectureBoardService;
import kr.or.ddit.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lectureBoard")
public class LectureBoardController {
	@Autowired
	LectureBoardService lectureBoardService;
	@Autowired
	FileUploadUtil fileUploadUtil;

	//게시판 리스트
	@GetMapping("/data/lectureData")
	public ModelAndView dataList(ModelAndView mav, String keyWord, String category, String lecaCd) {
		Lecture lecture = this.lectureBoardService.dataList(keyWord, category, lecaCd);
		List<LecData> lecData = lecture.getLecDataList();

		mav.addObject("lecData", lecData);
		mav.addObject("lecture", lecture);
		mav.setViewName("lectureBoard/data/lectureData");

		return mav;
	}
	//게시물 상세
	@GetMapping("/data/dataDetail")
	public ModelAndView dataDetail(ModelAndView mav,String ldtCd) {
		LecData lecData =  this.lectureBoardService.dataDetail(ldtCd);
		
		mav.addObject("lecData", lecData);
		mav.setViewName("lectureBoard/data/dataDetail");
		return mav;
	}
	
	//게시물 수정
	@PostMapping("data/dataUpdate")
	public String updateData(@RequestParam MultipartFile[] files, @ModelAttribute LecData lecData) {
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (files[0].getSize() > 0) {
			result = this.fileUploadUtil.fileUploadAction(files);
			if (result > 0) {
				map.put("result", result);
				map.put("ldtTtl",lecData.getLdtTtl());
				map.put("ldtCon",lecData.getLdtCon() );
				map.put("ldtWriter", lecData.getLdtWriter());
				map.put("ldtCd", lecData.getLdtCd());
				this.lectureBoardService.dataUpdate(map);
			}
			return "redirect:/lectureBoard/data/dataDetail?lecaCd=" + lecData.getLecaCd() + "&&ldtCd=" +lecData.getLdtCd();
		}
		map.put("result", result);
		map.put("result", result);
		map.put("ldtTtl",lecData.getLdtTtl());
		map.put("ldtCon",lecData.getLdtCon() );
		map.put("ldtWriter", lecData.getLdtWriter());
		map.put("ldtCd", lecData.getLdtCd());
		this.lectureBoardService.dataUpdate(map);

		return "redirect:/lectureBoard/data/dataDetail?lecaCd=" + lecData.getLecaCd() + "&&ldtCd=" +lecData.getLdtCd();
	}
	
	//게시물 삭제
	@GetMapping("data/dataDelete")
	public String deleteData(String ldtCd,String lecaCd) {
		this.lectureBoardService.dataDelete(ldtCd);
		return "redirect:/lectureBoard/data/lectureData?lecaCd=" + lecaCd;
	}

	@GetMapping("data/dataInsert")
	public String insertData(String lecaCd) {
		return "lectureBoard/data/dataInsert";
	}
	@PostMapping("data/dataInsert")
	public String insertData2(@RequestParam MultipartFile[] files,@ModelAttribute LecData lecData, Principal principal, String lecaCd) {
		String empNo = principal.getName();
		lecData.setLecaCd(Integer.parseInt(lecaCd));
		log.info(lecData.toString());
		
		Map<String, Object> map =  new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("ldtTtl", lecData.getLdtTtl());
		map.put("ldtCon", lecData.getLdtCon());
		map.put("lecaCd", lecData.getLecaCd());
		log.info(lecData.toString());
		if (files[0].getSize() > 0) {
			this.lectureBoardService.dataInsert1(map);
			this.fileUploadUtil.fileUploadAction(files);
		} else {
			log.info("첨부파일 없어용");
			this.lectureBoardService.dataInsert2(map);
		}
		// 경로 문제 ☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★
		return "redirect:/lectureBoard/data/dataDetail?lecaCd=" + lecData.getLecaCd() + "&&ldtCd=" +lecData.getLdtCd();
	}
}
