/**
 * 
 */

function proc1(){
	vinput = prompt("입력하세요");
	
	//div를 검색
	vdiv = document.getElementsByTagName('div')[0];
	
	vdiv.innerText = vinput;
	vdiv.innerHTML = vinput;
	
	 str = "<h1>" + vinput + "</h1>";
	vdiv.innerHTML = str;
//	vdiv.innerText = str;
	
	
	
	
}