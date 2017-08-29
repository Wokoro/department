class AdminsessionsController < ApplicationController
	def index
		
	end

	def course
		ccode = params[:ccode]
		ctitle = params[:ctitle]
		units = params[:units]
		level = params[:level]
		semester = params[:semester]
		@course = Course.create(ccode: ccode, ctitle: ctitle, units: units, level: level, semester: semester);
		respond_to do |format|
			format.json { render json:  @course }
      		format.js { render :nothing => true }
		end
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