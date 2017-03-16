module LecturersessionsHelper
	
	def log_in(lecturer)
		session[:staff_id] = lecturer.id
	end

	def current_studetn
		@current_lecturer ||= Lecturer.find_by(staff_id: session[:staff_id])
	end

	def logged_in?
		!current_lecturer.nil?
	end

	def log_out
		session.delete(:staff_id)
		@current_lecturer = nil
	end

end