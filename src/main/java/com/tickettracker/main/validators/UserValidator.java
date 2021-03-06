package com.tickettracker.main.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.tickettracker.main.models.User;
import com.tickettracker.main.services.UserService;

@Component
public class UserValidator implements Validator{
private final UserService userService;
	public UserValidator(UserService userService) {
		this.userService = userService;
	}
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "Match");
        }
		User foundUser = userService.findUserByEmail(user.getEmail());
		if(foundUser != null) {
			errors.rejectValue("email", "Match");
		}
    }
}
