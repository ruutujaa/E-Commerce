package in.co.ecommerce.form;

import javax.validation.constraints.NotEmpty;

import in.co.ecommerce.dto.BaseDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChangePasswordForm extends BaseForm  {

	@NotEmpty(message = "Old Password is required")
	private String oldPassword;
	
	@NotEmpty(message = "Confirm Password is required")
	private String confirmPassword;
	
	@NotEmpty(message = "New Passeword is required")
	private String newPassword;

	

	@Override
	public BaseDTO getDTO() {
		return null;
	}

	@Override
	public void populate(BaseDTO bDto) {
	}
	
}
