package my.batis.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.DirectQuestionVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class DirectQuestionDAOImpl implements DirectQuestionDAO {
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "DirectQuestionMapper";
	private static final String INSERT = NS+".insertDirectQuestion";
	private static final String VIEW = NS+".viewDirectQuestion";
	private static final String UPDATE = NS+".updateDirectQuestion";
	private static final String DELETE = NS+".deleteDirectQuestion";
	private static final String LIST = NS+".directQuestionList";
	private static final String MY_LIST = NS+".myDirectQuestionList";
	
	
	@Override
	public void insertDirectQuestion(DirectQuestionVO vo) {
		sqlSession.insert(INSERT, vo);
	}

	@Override
	public DirectQuestionVO viewDirectQuestion(Integer idx) {
		return sqlSession.selectOne(VIEW, idx);
	}

	@Override
	public void updateDirectQuestion(DirectQuestionVO vo) {		
		sqlSession.update(UPDATE, vo);

	}

	@Override
	public void deleteDirectQuestion(Integer idx) {
		sqlSession.delete(DELETE, idx);
	}

	@Override
	public List<DirectQuestionVO> directQuestionList() {
		return sqlSession.selectList(LIST);
	}

	@Override
	public Integer getMaxIdx() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DirectQuestionVO> listPage(Criteria cri) {
		return null;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DirectQuestionVO> myDirectQuestionList(String user_id) {
		return sqlSession.selectList(MY_LIST, user_id);
	}

}
