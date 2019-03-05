package my.batis.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.CartVO;
import my.batis.project.dto.Criteria;
import my.batis.project.dto.OrderDetailVO;
import my.batis.project.dto.OrderVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "OrderMapper";
	private static final String INSERT = NS+".insertOrder";
	private static final String UPDATE = NS+".updateOrder";
	private static final String DELETE = NS+".deleteOrder";
	private static final String LIST = NS+".orderList";
	private static final String CARTCOUNT = NS+".orderCnt";
	
	private static final String INSERT_DETAIL = NS+".insertOrderDetail";
	private static final String SEARCH_LIST = NS+".searchOrderList";
	private static final String GETTOTALCOUNT = NS+".gettotalcount";
	private static final String LIST_EXCEL = NS+".searchOrderListToExcel";

	@Override
	public void insertOrder(OrderVO vo) {
		sqlSession.insert(INSERT, vo);
	}

	@Override
	public void updateOrder(OrderVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteOrder(Integer idx) {
		// TODO Auto-generated method stub

	}

	@Override
	public int orderCnt(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void insertOrderDetail(List<OrderDetailVO> vo) {
		sqlSession.insert(INSERT_DETAIL, vo);
		
	}

	@Override
	public List<OrderVO> orderList(String user_id, String from_date, String to_date) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("from_date", from_date);
		map.put("to_date", to_date);
		
		return sqlSession.selectList(LIST, map);
	}

	@Override
	public List<OrderVO> searchOrderList(Criteria cri) {
		return sqlSession.selectList(SEARCH_LIST, cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne(GETTOTALCOUNT, cri);
	}

	@Override
	public List<OrderVO> searchOrderListToExcel(Criteria cir) {	
		return sqlSession.selectList(LIST_EXCEL, cir);
	}

}
