package kr.korea.my.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.korea.my.service.MemberService;
import kr.korea.my.utils.UploadFileUtils;
import kr.korea.my.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
//컨트롤러 오노테이션으로 @Controller 붙으면 컨트롤러로 인식 
		

		@Controller
		public class HomeController {
			
			private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
			
		@Autowired
			MemberService memberService;
			//★ MemberServiceImp 연결부위


		@Resource
		String uploadPath;
		
						
		@RequestMapping(value = "/", method = RequestMethod.GET)
			public String home(Model model){
				logger.info("메인페이지");
		
				return "home";
			}
		/**
		 * 회원 가입 하는 곳 
		 * **/
		@RequestMapping(value = "/signup", method = RequestMethod.GET)
		public String signupGet(Model model){
			logger.info("회원가입 페이지 실행");
			return "signup";	
		}
	
		@RequestMapping(value = "/signup", method = RequestMethod.POST)
		public String signupPOST(MemberVO mVo){
			logger.info("회원가입 진행중");
			   		
			System.out.println(mVo.getId());
			
			if(memberService.signup(mVo))
	
				return "redirect:/signin";
			else
				return "redirect:/signup";
		}
	
		
		/**
		 * 로그인 하는곳 
		 * **/
		@RequestMapping(value = "/signin", method = RequestMethod.GET)
		public String signinGet(Model model){
			logger.info("로그인창");
			return "signin";
			}   
	  
		@RequestMapping(value = "/signin", method = RequestMethod.POST)
		public String signinPOST(Model model, MemberVO mVo){
			logger.info("로그인창");
			System.out.println(mVo);
			MemberVO user = memberService.signin(mVo);
			if(user != null) {
				model.addAttribute("user", user);
				return "redirect:/board/mainList";  // 성공시 이동되는 창
			}
				return "redirect:/signin";   // 실패시 이동되는창
	   	}
	  
		
		/**
		 * 회원 정보 수정하는곳 
		 * **/
		@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
		public String memberModifyGet(){
			logger.info("회원정보 수정페이지");
			return "member/modify";
			}
	      
		@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
		public String memberModifyPOST(MemberVO mVo,String oldPw, HttpServletRequest r){
			logger.info("회원정보 진행중");
			System.out.println(mVo);
			System.out.println(oldPw);
			MemberVO user = memberService.modify(mVo,oldPw);
			if( user != null) {
				r.getSession().removeAttribute("user");
				//기존에 있는 유저정보 삭제
				
				r.getSession().setAttribute("user", user);
				//유저정보를 새로운 정보로 입력
				
				return "redirect:/board/mainList";
			}
			return "redirect:/board/mainList";  	 
	}
				
				
		
		
		/**
		* 로그아웃 해주는 곳 
		* **/
		@RequestMapping(value="/signout")
		public String signout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/board/mainList";
		}		
			
			
		
		@RequestMapping(value ="/dup")
		@ResponseBody
		public Map<Object, Object> idcheck(@RequestBody String id){
		    Map<Object, Object> map = new HashMap<Object, Object>();
		    
		    
		    boolean isMember = memberService.isMember(id);
		    map.put("isMember", isMember);
		    		    
		    return map;
		}
			
			
	/**
	* 이메일로 회원정보 찾기 
	* **/
		private JavaMailSender mailSender;
		@RequestMapping(value = "/mail/mailForm")
			public String mailForm() {
			    return "mail";
		}  
	
		// mailSending 코드
		@RequestMapping(value = "/mail/mailSending")
		public String mailSending(HttpServletRequest request) {
			String setfrom = "sino012ho@gmail.com";         
		    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
		    String title   = request.getParameter("title");      // 제목
		    String content = request.getParameter("content");    // 내용
					    try {
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		            = new MimeMessageHelper(message, true, "UTF-8");
					        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			        messageHelper.setTo(tomail);     // 받는사람 이메일
			        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			        messageHelper.setText(content);  // 메일 내용
	
			        mailSender.send(message);
			        
			        System.out.println();
			    } catch(Exception e){
			        System.out.println(e);
			    }
	
			    return "redirect:/mail/mailForm";
			}
							
			
			@RequestMapping(value = "/password/find")
			public String passwordFind() {
	
			    return "member/find";
			}  
			
			
			// 비밀 번호 찾기 
			@RequestMapping(value ="/checkemail")
			@ResponseBody
			public Map<Object, Object> emailcheck(
			
			@RequestBody String str){
		    Map<Object, Object> map = new HashMap<Object, Object>();
					    
			    String [] arr = new String [2];
			    arr = str.split("&");
			    String id = arr[0];
			    String email = "";
			    
			    try {
					email = URLDecoder.decode(arr[1], "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			    
			    id = memberService.getVal(id);    
			    email = memberService.getVal(email);
			    
			    
			    boolean isOk = memberService.checkMember(id,email);
			    map.put("isOk", isOk);
			    
			    return map;
			}
			
			
			@RequestMapping(value = "/password/send")
			public String passwordSend(String id, String email) {
				
				//비밀번호 생성
				String newPw = memberService.creatPw();
				
				//생성된 비밀번호 디비에 저장
				memberService.modify(id, email, newPw);
				
				//이메일 발송
				String title = "변경된 비밀번호입니다.";
				String contents = "변경된 비밀번호입니다.\n"+newPw+"\n";
				memberService.sendMail(email,title,contents);
				System.out.println(newPw);
				
			    return "send";
			}
		
			
			
		//프로필 사진의 이미지 업로드 소스
		 @RequestMapping(value = "/member/fileUpload", method = RequestMethod.POST)
		 public String fileUpload(MultipartFile file, HttpServletRequest r,MemberVO mVo) throws IOException, Exception{ 
			 MemberVO user = (MemberVO)r.getSession().getAttribute("user");
			 if(file.getOriginalFilename().length() != 0) {
				 
				 String fileTmp = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
				 memberService.updateImg(user.getId(), fileTmp);
				 user.setProfile(fileTmp);
			 }
			 
			memberService.registerBoard(mVo);
		    
			r.getSession().removeAttribute("user");
			r.getSession().setAttribute("user",user );
			
		    return "redirect:/board/mainList";
		 }
	
		 
		// 로그인시 비번과 패스워드가 맞는지 비교한다.
		 @RequestMapping(value ="/myDup")
			@ResponseBody
			public Map<Object, Object> idpwcheck(String id, String pw){
			    Map<Object, Object> map = new HashMap<Object, Object>();
			    			System.out.println(id+"+"+pw);	    
			    boolean isLogin = memberService.isLogin(id, pw);
			    
			    // isLogin 정보를 isMember 정보에 넣는다.
			    map.put("isMember", isLogin);
			    		    
			    return map;
			}
			 
		}