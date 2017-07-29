class AdminsessionsController < ApplicationController
	def new
		
	end

	def create
		admin = Admin.find_by(name: params[:adminsession][:name])
		if admin 
			login_admin(admin)
			render 'admin_welcome'
		else
			render plain: 'log in failed'
		end
	end

	def destroy
		logout_admin
		redirect_to root_url
	end
end