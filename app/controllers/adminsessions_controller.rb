class AdminsessionsController < ApplicationController
	def index
	end

	def new
		
	end

	def create
		admin = Admin.find_by(name: params[:adminsession][:name])
		if admin 
			login_admin(admin)
			redirect_to admin_index_path
		else
			flash[:error] = "Username or Password is not incorrect"
			redirect_to admin_login_path
		end
	end

	def destroy
		logout_admin
		redirect_to root_url
	end
end