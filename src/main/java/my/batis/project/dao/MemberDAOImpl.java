package my.batis.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.MemberVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "MemberMapper";
	private static final String INSERT = NS+".insertMember";
	private static final String VIEW = NS+".viewMember";
	private static final String UPDATE = NS+".updateMember";
	private static final String DELETE = NS+".deleteMember";
	private static final String LIST = NS+".memberList";
	private static final String GETTOTALCOUNT = NS+".getTotalCount";
	
	private static final String lOGINMEMBER = NS+".loginMember";
	private static final String IDCHECK = NS+".idCheck";

	@Override
	public void insertMember(MemberVO vo) {
		this.sqlSession.insert(INSERT, vo);
	}

	@Override
	public MemberVO viewMember(String id) {
		return sqlSession.selectOne(VIEW, id);
	}

	@Override
	public void updateMember(MemberVO vo) {
		sqlSession.update(UPDATE, vo);
	}

	@Override
	public void deleteMember(String id) {
		sqlSession.delete(DELETE, id);
	}

	@Override
	public List<MemberVO> memberList(Criteria cri) {
		return sqlSession.selectList(LIST, cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne(GETTOTALCOUNT, cri);
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		return sqlSession.selectOne(lOGINMEMBER, vo);
	}

	@Override
	public MemberVO idCheck(String id) {
		return sqlSession.selectOne(IDCHECK, id);
	}

}
