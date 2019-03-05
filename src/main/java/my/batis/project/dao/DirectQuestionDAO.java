package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.DirectQuestionVO;

public interface DirectQuestionDAO {
	public void insertDirectQuestion(DirectQuestionVO vo);	
	public DirectQuestionVO viewDirectQuestion(Integer idx);
	public void updateDirectQuestion(DirectQuestionVO vo);
	public void deleteDirectQuestion(Integer idx);
	public List<DirectQuestionVO> directQuestionList();
	public Integer getMaxIdx();
	public List<DirectQuestionVO> listPage(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public List<DirectQuestionVO> myDirectQuestionList(String user_id);
	
}
