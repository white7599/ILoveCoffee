package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.OrderDeliveryVO;

public interface OrderDeliveryDAO {
	public void insertOrderDelivery(OrderDeliveryVO vo);
	public void updateOrderDelivery(OrderDeliveryVO vo);
	public void deleteOrderDelivery(Integer idx);
	public List<OrderDeliveryVO> orderDeliveryList(String user_id);
	public int orderDeliveryCnt(String user_id);
}
