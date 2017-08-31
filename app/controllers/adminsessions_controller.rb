class AdminsessionsController < ApplicationController
	def index
		
	end

	def new
		
	end

	def all_courses
		query = params[:query]
		list_course = Course.pluck(:ccode)
	respond_to {
		|format|
		if(query=="")
			format.json
			format.html{render :nothing => true}
			format.js{render :nothing => true}
		else
			$up=query.upcase
			res = list_course.select{
			|x|
			 (x=="p"||x.include?($up))
			}
			format.json{render json: res.to_json}
			format.html{render :nothing => true}
			format.js{render :nothing => true}
		end
	}
		
	end

	def create_course
		ccode = params[:ccode]
		ctitle = params[:ctitle]
		units = params[:units]
		level = params[:level]
		semester = params[:semester]
		@course = Course.create(ccode: ccode, ctitle: ctitle, units: units, level: level, semester: semester);
		respond_to do |format|
			format.json { render json:  @course }
      		format.js { render :nothing => true }
      		format.html { render :nothing => true }
		end
	end

	def edit_course
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