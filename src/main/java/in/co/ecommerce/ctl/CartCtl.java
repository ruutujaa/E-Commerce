package in.co.ecommerce.ctl;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import in.co.ecommerce.dto.CartDTO;
import in.co.ecommerce.dto.UserDTO;
import in.co.ecommerce.exception.DuplicateRecordException;
import in.co.ecommerce.form.CartForm;
import in.co.ecommerce.service.CartServiceInt;
import in.co.ecommerce.service.ProductServiceInt;
import in.co.ecommerce.util.DataUtility;



@Controller
@RequestMapping("/ctl/cart")
public class CartCtl extends BaseCtl {

	@Autowired
	private CartServiceInt service;

	@Autowired
	private ProductServiceInt productService;

	@ModelAttribute
	public void preload(Model model) {

	}

	@GetMapping
	public String 
	//esd
	display(@RequestParam(required = false) Long id, 
			//esd
			Long iId, @ModelAttribute("form") CartForm form,
			HttpSession session, Model model) {
		UserDTO uDto = (UserDTO) session.getAttribute("user");
		try {
			if (DataUtility.getLong(String.valueOf(iId)) > 0) {
				CartDTO cDto = new CartDTO();
				cDto.setProduct(productService.findBypk(iId));
				cDto.setQuantity("1");
				cDto.setUser(uDto);
				cDto.setPrice(productService.findBypk(iId).getPrice());
				cDto.setTotalPrice(
						String.valueOf(DataUtility.getLong(cDto.getQuantity()) * DataUtility.getLong(cDto.getPrice())));
				service.add(cDto);
			}
			return "redirect:/ctl/cart/search";
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}
		return "cart";
	}

	@PostMapping
	public String submit(@RequestParam("image") MultipartFile file, @Valid @ModelAttribute("form") CartForm form,
			BindingResult bindingResult, HttpSession session, Model model) {

		if (OP_RESET.equalsIgnoreCase(form.getOperation())) {
			return "redirect:/ctl/cart";
		}

		try {
			if (OP_SAVE.equalsIgnoreCase(form.getOperation())) {

				if (bindingResult.hasErrors()) {
					return "cart";
				}
				CartDTO bean = (CartDTO) form.getDTO();
				UserDTO login = (UserDTO)session.getAttribute("user");
				bean.setModifiedBy(login.getLogin());
				if (bean.getId() > 0) {
					service.update(bean);
					model.addAttribute("success", "Cart update Successfully!!!!");
				} else {
					service.add(bean);
					model.addAttribute("success", "Cart Added Successfully!!!!");
				}
				return "cart";
			}
		} catch (DuplicateRecordException e) {
			model.addAttribute("error", e.getMessage());
			return "cart";
		}
		return "";
	}

	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchList(@ModelAttribute("form") CartForm form, @RequestParam(required = false) String operation,
			Long cid, HttpSession session,HttpServletRequest request, Model model) {

		if (OP_RESET.equalsIgnoreCase(operation)) {
			return "redirect:/ctl/cart/search";
		}

		int pageNo = form.getPageNo();
		int pageSize = form.getPageSize();

		if (OP_NEXT.equals(operation)) {
			pageNo++;
		} else if (OP_PREVIOUS.equals(operation)) {
			pageNo--;
		} else if (OP_NEW.equals(operation)) {
			return "redirect:/ctl/cart";
		}

		if("Checkout".equalsIgnoreCase(operation)) {
			return"redirect:/ctl/order";
		}
		
		pageNo = (pageNo < 1) ? 1 : pageNo;
		pageSize = (pageSize < 1) ? 10 : pageSize;

		if (OP_DELETE.equals(operation)) {
			pageNo = 1;
			if (form.getIds() != null) {
				for (long id : form.getIds()) {
					CartDTO dto = new CartDTO();
					dto.setId(id);
					service.delete(dto);
				}
				model.addAttribute("success", "Deleted Successfully!!!");
			} else {
				model.addAttribute("error", "Select at least one record");
			}
		}
		
		UserDTO uDto = (UserDTO) session.getAttribute("user");
		
		try {
		if("Update".equalsIgnoreCase(operation)) {
			CartDTO cDto=new CartDTO();
			cDto.setUser(uDto);
			List cList=service.search(cDto);
			Iterator<CartDTO> cit=cList.iterator();
			int i=1;
			while (cit.hasNext()) {
				CartDTO cartDTO = (CartDTO) cit.next();
				String quant=DataUtility.getString(request.getParameter("qunatity"+i++));
				cartDTO.setQuantity(quant);
				cartDTO.setTotalPrice(String.valueOf(DataUtility.getLong(quant)*DataUtility.getLong(cartDTO.getPrice())));
					service.update(cartDTO);
			}
		}if(OP_DELETE.equalsIgnoreCase(operation)) {
			CartDTO deleteCart=service.findBypk(DataUtility.getLong(String.valueOf(cid)));
			service.delete(deleteCart);
			return"redirect:/ctl/cart/search";
		}
		} catch (DuplicateRecordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		CartDTO 
		dto = (CartDTO) form.getDTO();
		if(uDto.getRoleId()==2) {
			dto.setUser(uDto);
		}
		List<CartDTO> list = service.search(dto, pageNo, pageSize);
		List<CartDTO> totallist = service.search(dto);
		model.addAttribute("list", list);

		if (list.size() == 0 && !OP_DELETE.equalsIgnoreCase(operation)) {
			model.addAttribute("error", "Record not found");
		}

		int listsize = list.size();
		int total = totallist.size();
		int pageNoPageSize = pageNo * pageSize;

		form.setPageNo(pageNo);
		form.setPageSize(pageSize);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("listsize", listsize);
		model.addAttribute("total", total);
		model.addAttribute("pagenosize", pageNoPageSize);
		model.addAttribute("form", form);
		return "cartList";
	}
}
