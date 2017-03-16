class LecturersController < ApplicationController

	def new
	end

	def index
	end

	def create
		
		@lecturer = Lecturer.new(params.require(:lecturer).permit(:staff_id, :password))
		if @lecturer.save
			render plain: 'REGISTRATION SUCESSFULL'
		else
			render plain: 'REGISTRATION FAILED'
		end

	end

	def edit
	end

end