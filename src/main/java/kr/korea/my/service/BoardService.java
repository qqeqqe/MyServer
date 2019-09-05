package kr.korea.my.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.korea.my.pagination.Criteria;
import kr.korea.my.vo.BoardVO;



@Service
public interface BoardService {
	ArrayList<BoardVO> getBoardList(Criteria cri);
	BoardVO getBoard(Integer num);
	void updateView(Integer num);
	void updateBoard(BoardVO bVo, HttpServletRequest r);
	void deleteBoard(Integer num);
	void registerBoard(BoardVO boardVo);
	boolean isWriter(Integer num, HttpServletRequest r);
	int getTotalCount(Criteria cri); 
}