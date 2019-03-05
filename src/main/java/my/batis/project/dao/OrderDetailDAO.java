package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.OrderDetailVO;
import my.batis.project.dto.OrderVO;

public interface OrderDetailDAO {
	public void insertOrder(OrderVO vo);
	public void updateOrder(OrderVO vo);
	public void deleteOrder(Integer idx);
	public List<OrderDetailVO> orderDetailListByUser(String user_id);	// 사용자에 따른 리스트
	public List<OrderDetailVO> orderDetailListByOrder(int order_idx);	// 주문번호에 따른 리스트
	public int orderCnt(String user_id);
	
	public void insertOrderDetail(List<OrderDetailVO> vo);
}
