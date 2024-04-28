package in.co.ecommerce.dao;

import java.util.List;

import in.co.ecommerce.dto.OrderDTO;



public interface OrderDAOInt {

	public long add(OrderDTO dto);
	
	public void delete(OrderDTO dto);
	
	public OrderDTO findBypk(long pk);
	
	public OrderDTO findByName(String name);
	
	public void update(OrderDTO dto);
	
	public List<OrderDTO> list();
	
	public List<OrderDTO>list(int pageNo,int pageSize);
	
	public List<OrderDTO> search(OrderDTO dto);
	
	public List<OrderDTO> search(OrderDTO dto,int pageNo,int pageSize);
	
	
	
}
