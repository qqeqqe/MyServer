package kr.korea.my.service;

import kr.korea.my.vo.MemberVO;

public interface MemberService {
	
	public boolean signup(MemberVO mVo);
	public MemberVO signin(MemberVO mVo);
	
	public MemberVO modify(MemberVO mVo, String oldPw);
	public boolean isMember(String id);
	public String getVal(String id);
	public boolean checkMember(String id, String email);
	public String creatPw();
	public void modify(String id, String email, String newPw);
	public void sendMail(String email, String title, String contents);
	public void registerBoard(MemberVO mVo);
	public void updateImg(String id, String fileTmp);
	public boolean isLogin(String id, String pw);

}
