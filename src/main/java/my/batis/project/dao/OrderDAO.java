package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.OrderDetailVO;
import my.batis.project.dto.OrderVO;

public interface OrderDAO {
	public void insertOrder(OrderVO vo);
	public void updateOrder(OrderVO vo);
	public void deleteOrder(Integer idx);
	public List<OrderVO> orderList(String user_id, String from_date, String to_date);
	public int orderCnt(String user_id);
	
	public void insertOrderDetail(List<OrderDetailVO> vo);
	
	public List<OrderVO> searchOrderList(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public List<OrderVO> searchOrderListToExcel(Criteria cir);
}
