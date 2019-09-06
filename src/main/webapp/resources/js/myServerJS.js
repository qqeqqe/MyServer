// 네비바 정리하는곳
	function openTap(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("public-hidden");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("public-box");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
	}
	
// 우측상단위 로그인 버튼 누를시 액션
	function myInFo() {
	$('#loginBox').toggleClass('public-displayNone');
	document.getElementById("profilePhoto").style.display = "none";
	}

// 우측상단위 로그인 버튼 누를시 프로필사진 나오게 하기
	function pfOpen() {
		document.getElementById("profilePhoto").style.display = "block";
	}
	
	function pfclose() {
		document.getElementById("profilePhoto").style.display = "none";
	}