package kr.korea.my.dao;

import org.apache.ibatis.annotations.Param;

import kr.korea.my.vo.MemberVO;

// 다오는 DB에 접근하기 위한 파일
// 다만 DAO는 자바문이기 때문에 맵퍼를 이용해 쿼리문으로 DB에 접근한다.

public interface MemberDAO {

	MemberVO getMember(String id);
	void signup(MemberVO mVo);		
	void modify(MemberVO mVo);
	void upload(@Param("id")String id, @Param("profile")String profile);
}

