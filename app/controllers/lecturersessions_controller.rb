class LecturersessionsController < ApplicationController
	
	def new
		
	end

	def create

		lecturer = Lecturer.find_by(staff_id: params[:lecturersession][:staff_id].downcase)
		if lecturer && lecturer.authenticate(params[:lecturersession][:password])
			log_in(lecturer)
			render 'submit_result'
		else
			render plain: 'log in failed'
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end

end