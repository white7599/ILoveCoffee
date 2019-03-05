package my.batis.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.OrderDetailVO;
import my.batis.project.dto.OrderVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class OrderDetailDAOImpl implements OrderDetailDAO {
	
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "OrderMapper";
	private static final String DETAILLISTBYORDER = NS+".orderDetailListByOrder";

	@Override
	public void insertOrder(OrderVO vo) {
		// TODO Auto-generated method stub

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
	public List<OrderDetailVO> orderDetailListByUser(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDetailVO> orderDetailListByOrder(int order_idx) {
		return sqlSession.selectList(DETAILLISTBYORDER, order_idx);
	}

	@Override
	public int orderCnt(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertOrderDetail(List<OrderDetailVO> vo) {
		// TODO Auto-generated method stub

	}

}
