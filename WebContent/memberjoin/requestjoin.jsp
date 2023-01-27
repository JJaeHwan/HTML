<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://localhost/jquerypro/js/jquery.serializejson.min.js" type="text/javascript"></script>
  
<!--   <link rel="stylesheet" href="../css/public.css"> -->
  
<script type="text/javascript">
$(function () {
   /*id 데이터 검증*/
      $('#uid').on('keyup', function() {
         //입력한 id 값 가져오기
         idvalue=$('#uid').val().trim();
         
         idreg = /^[a-z][a-z0-9]{3,7}$/;
         
         if(!(idreg.test(idvalue))){
            // 틀린경우
            $(this).css('border','2px solid red');
            $('#idcheck').prop('disabled',true);
         }else{
            $(this).css('border','2px solid blue');
            $('#idcheck').prop('disabled',false);
            
         }
         
      })
   
   /*이름 데이터 검증*/
   $('#uname').on('click', function () {
      //입력한 이름 가져오기
      namevalue = $(this).val().trim();
      
      namereg = /^[가-힣]+|^[a-zA-Z]+$/;
      
      if(namereg.test(namevalue)){
         rkor = /^[가-힣]{2,5}$/;
         reng = /^[a-zA-Z]{5,20}$/;
         
         if(rkor.test(namevalue)){
            //한글
            $(this).css('border', '3px solid green')
         }else if(reng.test(namevalue)){
            //영문
            $(this).css('border', '3px solid green')
         }else{
            $(this).css('border', '2px solid red')
         }
         
      }else{
         //한글 또는 영문이 아닌 경우
         $(this).css('border', '2px solid red')
      }
   })
   
   /*이메일 검증*/
      $('#umail').on('keyup', function () {
      //입력한 이름 가져오기
      mailvalue = $(this).val().trim();
      
      mailreg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-z-A-Z]+){1,2}$/; //[안에 다쓰면] 순서가 없다 . 점은 \.해야함.
      
      if(namereg.test(namevalue)){
         rkor = /^[가-힣]{2,5}$/;
         reng = /^[a-zA-Z]{5,20}$/;
         
         if(rkor.test(namevalue)){
            //한글
            $(this).css('border', '3px solid green')
         }else if(reng.test(namevalue)){
            //영문
            $(this).css('border', '3px solid green')
         }else{
            $(this).css('border', '2px solid red')
         }
         
      }else{
         //한글 또는 영문이 아닌 경우
         $(this).css('border', '2px solid red')
      }
   })
   
   /*전화번호 검증*/
      $('#utel').on('keyup', function () {
      //입력한 이름 가져오기
      telvalue = $(this).val().trim();
      
      telreg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
//       telreg = /^\d{3}-\d{4}-\d{4}$/;
      
      if(namereg.test(namevalue)){
         rkor = /^[가-힣]{2,5}$/;
         reng = /^[a-zA-Z]{5,20}$/;
         
         if(rkor.test(namevalue)){
            //한글
            $(this).css('border', '3px solid green')
         }else if(reng.test(namevalue)){
            //영문
            $(this).css('border', '3px solid green')
         }else{
            $(this).css('border', '2px solid red')
         }
         
      }else{
         //한글 또는 영문이 아닌 경우
         $(this).css('border', '2px solid red')
      }
   })
   /*비밀번호 검증 - 영문대(아스키값 65-90)소문자(아스키값 97-122) 숫자(48-57) 특수문자가 반드시 하나씩 포함*/
   //전방탐색 : 찾을문자(?= 기준문자) 찾을 문자가 표현되지 않으면 기준문자는 반드시 포함되어야 한다.
      $('#pwd').on('keyup', function () {
      //입력한 이름 가져오기
      pwdvalue = $(this).val().trim();
      
//       pwdreg = /.*(?=[a-z])/
      pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()-_=+\|{};:,.<>?]).{10,20}$/;
      
      
      if(pwdreg.test(pwdvalue)){
   
         $(this).css('border', '3px solid green')
         
      }else{
         $(this).css('border', '2px solid red')
      }
   })
   
   /*id 중복 검사*/
   $('#idcheck').on('click', function () {
      //입력한 id값 가져오기
      idvalue = $('#uid').val().trim();
      
      if(idvalue.length < 1){
         alert("id를 입력하세요");
         return false;
      }
      
      //서버로 전송
      $.ajax({
         /*url : 'http://localhost/jquerypro/IDCheck.do',*/
         
         url : '<%= request.getContextPath()%>/iDCheck.do',
         type : 'get',
         data : {"id" : idvalue },
         success : function (res) {
            //alert(res.sw);
            $('#idres').html(res.sw).css('color', 'red');
         },
         error : function (xhr) {
            alert("상태 : " + xhr.status)
         },
         dataType : 'json'
         
      })
   })
   /* 번호검색 */
   $('#zipbtn').on('click', function() {
		window.open("zipserach.jsp", "우편번호찾기", "width=500 height=500 top=100 left=200")
	})
   
	/* 전송-가입하기 */
   //input type=button/ button type=button일 경우
   $('#send').on('click', function () {
   		// 입력한 모든 값을 다 가져온다 - idvalue, namevalue, mailvalue, telvalue
   		// birvalue, codevalue, add1value add2value
   		
//    		$("#ubir").val();
//    		$("#uzip").val();
//    		$("#uadd1").val();
//    		$("#uadd2").val();
   			
   		//자동으로 입력된 값 가져오기
   		formdata1 = $('form').serialize();
   		formdata2 = $('form').serializeArray();
   		formdata = $('form').serializeJSON();
   		console.log(formdata1, formdata2, formdata );
	   
   		// 서버로 보내기
   		$.ajax({
   			url : '<%=request.getContextPath()%>/Insert.do',
   			type : 'post',
   			data : formdata,
   			error : function(xhr) {
				alert("상태: " + xhr.status);
			},
			success : function(res) {
// 				alert(res.sw);
				$('#join').html(res.sw).css('color', 'red');
			}
   			
   		})
	   
   })
   
   //input type=submit / buttom type=submit일 경우 - form태그에서 onsubmit="return false;" 써놓고 밑을 작성
   $('form').on('submit', function () {
   
   })
   
})

</script>
  
</head>


<body>
<div class="container">
 <form action="/action_page.php" class="needs-validation" novalidate onsubmit="return false;">
    <div class="form-group">
      <label for="uid">아이디</label>
      <input type="button" value="중복검사" id="idcheck" class="btn btn-outline-primary btn-sm">
      <span id="idres"></span>
      <input type="text" class="form-control" id="uid" name="mem_id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uname">이름</label>
      <input type="text" class="form-control" id="uname"  name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="ubir">생년월일</label>
      <input type="date" class="form-control" id="ubir" name="mem_bir" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>

        <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="text" class="form-control" id="pwd"  name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
           <div class="form-group">
      <label for="utel">전화번호</label>
      <input type="text" class="form-control" id="utel" name="mem_hp" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일</label>
      <input type="text" class="form-control" id="umail" name="mem_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
 
    <div class="form-group">
      <label for="uzip">우편번호</label>
      <input type="button" value="번호검색" id="zipbtn" class="btn btn-outline-info btn-sm">
      <input type="button" value="번호Modal" id="zipbtn" class="btn btn-outline-info btn-sm"  data-toggle="modal" data-target="#zipModal">
      <input type="text" class="form-control" id="uzip" name="mem_zip" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uadd1">주소</label>
      <input type="text" class="form-control" id="uadd1" name="mem_add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uadd2">상세주소</label>
      <input type="text" class="form-control" id="uadd2" name="mem_add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>



    <input type="button" class="btn btn-primary" id="send" value="확인">
    <button type="submit" class="btn btn-primary">Submit</button> 
    <span id="join"></span>
  </form>
</div>

<!-- The Modal -->
<div class="modal" id="zipModal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h3 class="modal-title">우편번호 찾기</h3>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="box">
			<h1>우편번호 찾기</h1>
			<p>찾고자 하는 동이름을 입력하세요</p>
			
			<input type="text" id="dong">
			<input type="button" value="확인">
			<br><br>
			<div id="res"></div>
			
	    </div>	
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>