package kr.korea.my.service;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.korea.my.dao.MemberDAO;
import kr.korea.my.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
										
	@Autowired
	MemberDAO memberDao;
	
//	암호화 만드는 연결
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private JavaMailSender mailSender;
	
		
	@Override
	public boolean signup(MemberVO mVo){
		
		if(mVo == null)
		return false;
//		mVo.setName(""); <-- 이름을 입력안할때 사용 
		if(memberDao.getMember(mVo.getId()) != null)
			return false;
		
		String encodePw = passwordEncoder.encode(mVo.getPw());
		
		mVo.setPw(encodePw);
		
		memberDao.signup(mVo);
		return true;
	}
	
	
	
	@Override
	public MemberVO signin(MemberVO mVo) {
		if(mVo == null)  
			return null; 
		
		MemberVO oVo =  memberDao.getMember(mVo.getId()); 

		if( oVo == null)  
			return null;
		
		if(oVo.getPw().equals(mVo.getPw())) 
			return oVo;
		
		if(passwordEncoder.matches(mVo.getPw(), oVo.getPw()))
			return oVo;
		
		return null;
	}	
	
	

	@Override
	public MemberVO modify(MemberVO mVo, String oldPw){
		if(mVo == null) return null;
		
		if(passwordEncoder.matches(oldPw, memberDao.getMember(mVo.getId()).getPw())){
			mVo.setPw(passwordEncoder.encode(mVo.getPw()));
			memberDao.modify(mVo);
			return mVo;
		}
		return null;
	}


	@Override
	public boolean isMember(String id) {
		if (memberDao.getMember(id) == null) {
			return false;
		}
		return true;
	}


	@Override
	public String getVal(String id) {
		String [] arr = id.split("=");
		if(arr.length == 2)
			return arr[1];
		else
			return "";
		
	}


	@Override
	public boolean checkMember(String id, String email) {
		MemberVO user = memberDao.getMember(id);
		if(user != null && user.getEmail().contentEquals(email)) {
			return true;
		}
		return false;
	}


	@Override
	public String creatPw() {
		String str = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String pw="";
				for(int i=0; i <8 ; i++) {
				int r = (int)(Math.random()*62);
				pw += str.charAt(r);
				}
		return pw;
	}


	@Override
	public void modify(String id, String email, String newPw) {
		MemberVO user = memberDao.getMember(id);
		
		if(user == null) return;
		
		if(!user.getEmail().contentEquals(email)) return;
		
		String encodePw = passwordEncoder.encode(newPw);
		user.setPw(encodePw);
		memberDao.modify(user);
	}





	@Override
	public void sendMail(String email, String title, String contents) {
		  String setfrom = "sino012ho@naver.com";         
		    
		    try {
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		            = new MimeMessageHelper(message, true, "UTF-8");

		        messageHelper.setFrom(setfrom); 
		        messageHelper.setTo(email);     
		        messageHelper.setSubject(title);
		        messageHelper.setText(contents);

		        mailSender.send(message);
		    } catch(Exception e){
		        System.out.println(e);
		    }	
	}
	
	@Override
	public void registerBoard(MemberVO mVo) {
		
	}

	@Override
	public void updateImg(String id, String fileTmp) {
		memberDao.upload(id,fileTmp);
		
	}

	// 로그인시 아이디와 패스워드 비교하는곳
	@Override
	public boolean isLogin(String id, String pw){
		
		//DB에 저장된 id를 갖고와서 멤버 VO의 user에 넣는다 
		MemberVO user = memberDao.getMember(id);
		
		// 만일 갖고온 DB의 id가 없다면 거짓으로 돌린다.
		if(user == null)
			return false;
		
		// 암호화 되어있는 패스워드엔코더가 matche(일치)하는가(입력된 비번, DB에 저장된 비번) 
		if (passwordEncoder.matches(pw, user.getPw())) {
			return true;
		}
		return false;
	}
}

