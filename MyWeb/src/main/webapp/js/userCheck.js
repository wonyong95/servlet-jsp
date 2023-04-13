/**
 * 
 */
function member_check(){
	if(!isKor(mf.name)){
		alert('이름은 한글로 2자이상 가능해요');
		mf.name.select();
		return;
	}
}
/**
 * ^ : 시작을 의미
 * $ : 끝을 의미
 * 가-힣: 한글 범위
 * + : 패턴이 1개이상 반복된다는 의미
 * {2,}: 패턴문자가 2개 이상와야한다는 의미
 */
function isKor(input){
//	alert(input.value);
	let val=input.value;
	//정규식 객체: RegExp
//	let pattern=new RegExp(/multi/g);
	let pattern=/%[가-힣]{2, }$/
	//mulit문자열이 있는지 여부를 체크
	let b=pattern.test(val);
	//test()함수: 정규식 패턴에 매개변수 문자열이 맞으면 true를반환하고, 틀리면 false를반환
//	alert(b);
	return b;
}