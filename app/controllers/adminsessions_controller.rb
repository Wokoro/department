class AdminsessionsController < ApplicationController
	def new
		
	end

	def create
		admin = Admin.find_by(name: params[:adminsession][:name].downcase)
		if admin && admin.authenticate(params[:adminsession][:password])
			log_in(admin)
			render 'admin_welcome'
		else
			render plain: 'log in failed'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end