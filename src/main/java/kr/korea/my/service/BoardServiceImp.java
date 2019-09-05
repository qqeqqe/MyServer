package kr.korea.my.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.korea.my.dao.BoardDAO;
import kr.korea.my.pagination.Criteria;
import kr.korea.my.vo.BoardVO;
import kr.korea.my.vo.MemberVO;



@Service
public class BoardServiceImp implements BoardService {

	
	@Autowired
	BoardDAO boardDao;
	
	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {

		return boardDao.getBoardList(cri);
	}

	
	@Override
	public BoardVO getBoard(Integer num) {
		if(num == null)
			return null;
		return boardDao.getBoard(num);
	}


	@Override
	public void updateView(Integer num) {
		// TODO Auto-generated method stub
//		boardDao.updateViews(num);  게시판 클릭할때마다 조회수 올라가기
		
		//조회수와 게시판 수정시 업테이드 함
		BoardVO tmp = boardDao.getBoard(num);   
		 if(tmp != null) {
			 int oldViews = tmp.getViews();
			 tmp.setViews(oldViews+1);
			 boardDao.updateBoard(tmp);
		 }
		
	}


	// 게시판 수정을 하고 다른 회원이 게시판 수정을 못함
	@Override
	public void updateBoard(BoardVO bVo, HttpServletRequest r) {
		MemberVO user = (MemberVO)r.getSession().getAttribute("user");
		if(user == null || bVo == null) return;
		if(bVo.getWriter() != null && bVo.getWriter().equals(user.getId())) {
			boardDao.updateBoard(bVo);
		}
	}


	@Override
	public void registerBoard(BoardVO boardVo) {
		boardDao.registerBoard(boardVo);
	}


	@Override
	public void deleteBoard(Integer num) {
		if(num == null || num <= 0)	return;
		boardDao.deleteBoard(num);
		
	}


	@Override
	public boolean isWriter(Integer num, HttpServletRequest r) {
		BoardVO board = boardDao.getBoard(num);
		MemberVO user = (MemberVO)r.getSession().getAttribute("user");
		if(board != null && user != null && board.getWriter().equals(user.getId())) {
			return true;
		}
		return false;
	}


	@Override
	public int getTotalCount(Criteria cri) {
		return boardDao.getTotalCount(cri);
	}
}