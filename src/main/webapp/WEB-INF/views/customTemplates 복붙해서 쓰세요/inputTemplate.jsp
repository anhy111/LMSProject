<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/inputTemplate.css">

<div class="container">
  <div class="components">
    
   <!-- 라디오버튼 그룹1 -->
    <div class="segmented-control">
      <input type="radio" name="" value="3" id="tab-1" checked/>
      <label for="tab-1" class= "segmented-control__1">
        <p>Tab 1</p></label>
      
      <input type="radio" name="" value="4" id="tab-2" />
      <label for="tab-2" class= "segmented-control__2">
        <p>Tab 2</p></label>
      
      <input type="radio" name="" value="5" id="tab-3" />
      <label for="tab-3" class= "segmented-control__3">
        <p>Tab 3</p></label>
      
      <div class="segmented-control__color"></div><!-- 라디오 체크시 포커스해주는 div -->
    </div>
    
   <!-- 라디오버튼 그룹2 -->
    <div class="segmented-control2">
      <input type="radio" name="" value="3" id="tab-1" checked/>
      <label for="tab-3" class= "segmented-control__3">
        <p>Tab 4</p></label>
      
      <input type="radio" name="" value="4" id="tab-2" />
      <label for="tab-4" class= "segmented-control__4">
        <p>Tab 5</p></label>
      
      <input type="radio" name="" value="5" id="tab-5" />
      <label for="tab-5" class= "segmented-control__5">
        <p>Tab 6</p></label>
      
      <div class="segmented-control__color"></div><!-- 라디오 체크시 포커스해주는 div -->
    </div>
  
	  <div class="select">
	  <select>
	    <option value="1">Pure CSS Select</option>
	    <option value="2">No JS</option>
	    <option value="3">Nice!</option>
	  </select>
	</div>
  
 	<div class="centered-cover">
 		<div class="alert alert-info">
			<p id="target"><!-- 선택한 날짜가 입력됨 --></p>
		</div>
		<form>
			<input class="form" type="date">
		</form>
	</div> 
  
  	<div class="form">
  		<input type="text" class="form__input" />
  	</div>
  	
  	<div>
  		<textarea id="textarea"></textarea>
  	</div>
  
  <button class="cbtn btn__primary"><p><label>등록</label></p></button>
  <a onclick="dataReset()" class="cbtn btn__secondary"><label>취소</label></a>
  <button class="cbtn btn__secondary"><p><label>목록</label></p></button>
  
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	//선택한 날짜가 입력되게 함
	$('input[type="date"]').change(function() {
			/* on change get value then print to page */
			var outputDate = (this.value);
			$("#target").text(outputDate);
	});
	//textarea를 섬머노트로 출력
	$("#textarea").summernote();
		
	/*썸머노트사용법은 기본 : https://summernote.org/getting-started/#get--set-code 
								 심화 : https://summernote.org/deep-dive/ 참조
	활성화 : .summernote('disable');
	비활성화 : .summernote('enable');
	값이 있는지 확인 : .summernote('isEmpty')  -- 비었으면 true
	포커스 : .summernote('focus');
	내용 초기화 : .summernote('reset');
	*/
	
});

$("#textarea").summernote({
    placeholder: '사유를 작성해주세요',
    tabsize: 2,
    height: 200,
    codeviewFilter: true,
    codeviewIframeFilter: true
  });	

function dataReset(){
	
	var confirmResult = window.confirm("작성내용 모두 취소 하시겠습니까?");
	if (confirmResult == true) {
		form.reset();
		$("#textarea").summernote("reset");
	}else{
		return;
	}
}
</script>