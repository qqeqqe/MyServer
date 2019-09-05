package kr.korea.my.dao;

import java.util.ArrayList;

import kr.korea.my.pagination.Criteria;
import kr.korea.my.vo.BoardVO;



public interface BoardDAO {

	ArrayList<BoardVO> getBoardList(Criteria cri);
	BoardVO getBoard(Integer num);
	void updateViews(Integer num);
	void updateBoard(BoardVO tmp);
	void registerBoard(BoardVO boardVo);
	void deleteBoard(Integer num);
	int getTotalCount(Criteria cri); 
}
