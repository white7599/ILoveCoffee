package my.batis.project.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "MemberMapper";
	private static final String SELECT = NS+".selectAdmin";

	@Override
	public AdminVO selectAdmin(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		System.out.println(map.get("id"));
		System.out.println(map.get("pwd"));
		System.out.println(SELECT);
		return sqlSession.selectOne(SELECT, map);
		
	}

}
