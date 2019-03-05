package my.batis.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.CartVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class CartDAOImpl implements CartDAO {
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "CartMapper";
	private static final String INSERT = NS+".insertCart";
	private static final String UPDATE = NS+".updateCart";
	private static final String DELETE = NS+".deleteCart";
	private static final String LIST = NS+".cartList";
	private static final String CARTCOUNT = NS+".cartCnt";
	private static final String CARTCOUNTBYPRODUCT = NS+".cartCntByProduct";
	private static final String SUMPRICETOTAL = NS+".sumPriceTotal";
	private static final String DELETEALLCART = NS+".deleteAllCart";
	private static final String UPDATECARTPRODUCTCOUNT = NS+".updateCartProductCount";
	

	@Override
	public void insertCart(CartVO vo) {
		sqlSession.insert(INSERT, vo);
	}

	@Override
	public void updateCart(CartVO vo) {
		sqlSession.update(UPDATE, vo);
	}

	@Override
	public int deleteCart(Integer idx) {
		return sqlSession.delete(DELETE, idx);
	}

	@Override
	public List<CartVO> cartList(String user_id) {
		return sqlSession.selectList(LIST, user_id);
	}

	@Override
	public int cartCnt(String user_id) {
		return sqlSession.selectOne(CARTCOUNT, user_id);
	}

	@Override
	public int cartCntByProduct(CartVO vo) {
		return sqlSession.selectOne(CARTCOUNTBYPRODUCT, vo);
	}

	@Override
	public int sumPriceTotal(String user_id) {
		return sqlSession.selectOne(SUMPRICETOTAL, user_id);
	}

	@Override
	public int deleteAllCart(String user_id) {
		return sqlSession.delete(DELETEALLCART, user_id);
	}

	@Override
	public int updateCartProductCount(int idx, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("count", count);
		return sqlSession.update(UPDATECARTPRODUCTCOUNT, map);
	}

}
