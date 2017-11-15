class LoginSessionsController < ApplicationController

	def new
		
	end

	def create
		user_id = params[:loginsession][:name]

		user_password = params[:loginsession][:password]

		user = LoginDetail.find_by(user_name: user_id)

		if user && user.authenticate(user_password)
			user_type = user.user_type
			user_table_id = user.user_id

			case user_type
			when 0
				stud_user = Student.find_by(id: user_table_id)
				if(stud_user)
					login_stud(stud_user)
					redirect_to students_path
				else
					flash[:message] = "SORRY YOU ARE NO LONGER A STUDENT OF THIS DEPARTMENT PLEASE GO A REGISTER AS A STUDENT"
					redirect_to user_login_path
				end
			when 1
				lect_user = Lecturer.find_by(id: user_table_id)
				if(lect_user)
					login_lect(lect_user)
					redirect_to lecturers_path
				else
					flash[:message] = "SORRY YOU ARE NO LONGER A LECTURER OF THIS DEPARTMENT"
					redirect_to user_login_path
				end
			when 2 
				admin_user = Admin.find_by(id: user_table_id)
				if(admin_user)
					login_admin(admin_user)
					redirect_to admin_index_path
				else
					flash[:message] = "SORRY ADMIN PREVILAGES NOT GRANTED"
					redirect_to user_login_path
				end
			end
		else
			flash[:error] = "USER NAME OR PASSWORD IS INCORRECT PLEASE TRY AGAIN"
			redirect_to user_login_path
		end
	end

	def destroy
		
	end
end