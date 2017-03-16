class StudentsessionsController < ApplicationController
	
	def new
		
	end

	def create

		student = Student.find_by(matno: params[:studentsession][:matno].downcase)
		if student && student.authenticate(params[:studentsession][:password])
			log_in(student)
			render 'student_page'
		else
			render plain: 'log in failed'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end