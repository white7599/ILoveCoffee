package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.CartVO;

public interface CartDAO {
	public void insertCart(CartVO vo);
	public void updateCart(CartVO vo);
	public int deleteCart(Integer idx);
	public List<CartVO> cartList(String user_id);
	public int cartCnt(String user_id);
	
	public int cartCntByProduct(CartVO vo);
	public int sumPriceTotal(String user_id);
	public int deleteAllCart(String user_id);
	
	public int updateCartProductCount(int idx, int count);
	
}
