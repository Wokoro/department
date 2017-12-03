module ApplicationHelper
	def gen_login_password(user)
		user_activation_status = user.user_type == 2 ? 1 : 0
		@user_name = ""
		if user.user_type == 0
			@user_name = user.matno
		elsif user.user_type == 1
			@user_name = user.staff_id
		else
			user.name
		end
		@user_password =  SecureRandom.hex(10)
		login_detail = LoginDetail.create(user_name: @user_name, user_id: user.id, user_type: user.user_type, activation: user_activation_status, password: @user_password)
		return @user_password
	end
end
