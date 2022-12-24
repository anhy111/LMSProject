document.onkeydown = MBoxCheckKeyPress;

/*
 * 특수키 이벤트 막기
 */
function MBoxCheckKeyPress() {
	/*
	if (event.keyCode == 8 || event.keyCode == 16) // backspace, shift key 막기
		return false;
	*/
	/*
	if (event.keyCode == 16) // backspace, shift key 막기
		return false;

	if (event.altKey || event.ctrlKey) // Alt, Ctrl Key
		return false;

	ekey = event.keyCode; // 키입력

	if (ekey >= 112 && ekey <= 123) { // Function Key
		event.keyCode = 0;
		return false;
	}
	*/
	return;
}

document.oncontextmenu = sourceViewHandler;

/*
 * 소스 보기 막기
 */
function sourceViewHandler() {
	return false; // 주석 풀면 오른쪽 마우스 소스 보기 막힘
}

/*
 * 키 이벤트 처리
 */
function fCatchKeyEvent( e, command ) {
	var E = e ? e : window.event;
	if ( E.keyCode == Event.KEY_RETURN ) { // Enter Key
		eval( command ); 
	}
}
