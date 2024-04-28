package in.co.ecommerce.form;


import javax.validation.constraints.NotEmpty;

import in.co.ecommerce.dto.BaseDTO;
import in.co.ecommerce.dto.UserDTO;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ForgetPasswordForm extends BaseForm {

	@NotEmpty(message = "Login is required")
	private String login;

	@Override
	public BaseDTO getDTO() {
		UserDTO dto = new UserDTO();
		dto.setLogin(login);
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto) {
		
	}

}
