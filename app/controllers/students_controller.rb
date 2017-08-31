class StudentsController < ApplicationController
	def index
	end

	def create
		
		@student = Student.new(params.require(:student).permit(:matno, :password))
		if @student.save
			render plain: 'REGISTRATION SUCESSFULL'
		else
			render plain: 'REGISTRATION FAILED'
		end
	end

	def edit
	end

	def new
	end

	def show
		respond_to do |f|
			f.json{render :json}
		end
	end
end
