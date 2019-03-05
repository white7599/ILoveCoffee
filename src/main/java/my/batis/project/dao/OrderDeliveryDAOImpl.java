package my.batis.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.OrderDeliveryVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class OrderDeliveryDAOImpl implements OrderDeliveryDAO {
	
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "OrderMapper";
	private static final String INSERT = NS+".insertOrderDelivery";
	private static final String UPDATE = NS+".updateOrderDelivery";
	private static final String DELETE = NS+".deleteOrderDelivery";
	private static final String LIST = NS+".orderDeliveryList";
	private static final String CARTCOUNT = NS+".orderDeliveryCnt";
	@Override
	public void insertOrderDelivery(OrderDeliveryVO vo) {
		sqlSession.insert(INSERT, vo);		
	}
	@Override
	public void updateOrderDelivery(OrderDeliveryVO vo) {
		sqlSession.update(UPDATE, vo);		
	}
	@Override
	public void deleteOrderDelivery(Integer idx) {
		sqlSession.delete(DELETE, idx);
		
	}
	@Override
	public List<OrderDeliveryVO> orderDeliveryList(String user_id) {
		return sqlSession.selectList(LIST, user_id);
	}
	@Override
	public int orderDeliveryCnt(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
