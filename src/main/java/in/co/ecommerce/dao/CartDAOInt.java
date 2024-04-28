package in.co.ecommerce.dao;

import java.util.List;

import in.co.ecommerce.dto.CartDTO;



public interface CartDAOInt {

	public long add(CartDTO dto);
	
	public void delete(CartDTO dto);
	
	public CartDTO findBypk(long pk);
	
	public CartDTO findByName(String name);
	
	public void update(CartDTO dto);
	
	public List<CartDTO> list();
	
	public List<CartDTO>list(int pageNo,int pageSize);
	
	public List<CartDTO> search(CartDTO dto);
	
	public List<CartDTO> search(CartDTO dto,int pageNo,int pageSize);
	
	
	
}
