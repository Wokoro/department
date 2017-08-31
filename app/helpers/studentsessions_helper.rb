module StudentsessionsHelper

	def login_stud(student)
		session[:student_id] = student.id
	end

	def current_student
		return @current_student ||= Student.find_by(id: session[:student_id])
	end

	def stud_logged_in?
		!current_student.nil?
	end

	def logout_stud
		session.delete(:student_id)
		current_student = nil
	end

	def logged_in_user
    		if logged_in?
    		else
    			flash[:error] = "You must login first"
    			redirect_to signin_path
    		end
    	end

# LEVEL IMPLEMENTATION SHOULD BE CHECKED IF THE LEVEL BE INCREMENTED EVERY SESSION OF AFTER EACH REGISTRATION PER/SESSION
	def student_level(stud)
		reg_session = stud.registrations.select(:session).where(student_id: stud.id).first

		if (reg_session.nil?)
			return "100"
		else
			$first_reg_session = reg_session.session[-4..-1].to_i
			current_session = Util.first.value[-4..-1].to_i
			current_level = current_session - $first_reg_session
			return (current_level+1).to_s
		end		
	end

end