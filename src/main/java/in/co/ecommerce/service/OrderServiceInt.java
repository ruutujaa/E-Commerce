package in.co.ecommerce.service;

import java.util.List;

import in.co.ecommerce.dto.OrderDTO;
import in.co.ecommerce.exception.DuplicateRecordException;

public interface OrderServiceInt {

	public long add(OrderDTO dto) throws DuplicateRecordException;

	public void delete(OrderDTO dto);

	public OrderDTO findBypk(long pk);

	public OrderDTO findByName(String name);

	public void update(OrderDTO dto) throws DuplicateRecordException;

	public List<OrderDTO> list();

	public List<OrderDTO> list(int pageNo, int pageSize);

	public List<OrderDTO> search(OrderDTO dto);

	public List<OrderDTO> search(OrderDTO dto, int pageNo, int pageSize);
	

}
