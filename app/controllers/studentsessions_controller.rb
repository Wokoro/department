class StudentsessionsController < ApplicationController
	
	def new
		
	end

	def create

		student = Student.find_by(matno: params[:studentsession][:matno].downcase)
		if student #&& student.authenticate(params[:studentsession][:password])
			login_stud(student)
			redirect_to students_path
		else
			render plain: 'log in failed'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end

	def notification
		
	end
end