class CreateUserLoginDetailsController < ApplicationController
	def new
	end

	def create

		user_id = params[:login_details][:user_id].to_i
		user_type = params[:login_details][:user_status].to_i
		user_activation_status = params[:login_details][:user_activation_status].to_i
		user_password = params[:login_details][:user_password]

		login_detail = LoginDetail.new(user_id: user_id, user_type: user_type, activation: user_activation_status, password: user_password, password_confirmation: user_password)

		if login_detail.save
			render plain: "LOGIN DETAILS ADDED"
		else
			render plain: "UNABLE TO CREATE LOGIN DETAILS"
		end
	end
end
