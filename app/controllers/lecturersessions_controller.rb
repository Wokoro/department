class LecturersessionsController < ApplicationController
	
	def new
		
	end

	def create

	lecturer = Lecturer.find_by(staff_id: params[:lecturersession][:staff_id].downcase)
		if lecturer #&& lecturer.authenticate(params[:lecturersession][:password])
			login_lect(lecturer)
			redirect_to lecturers_path
		else
			render plain: 'log in failed'
		end
	end

	def destroy
		logout_lect
		redirect_to root_url
	end

end