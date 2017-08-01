class AttendancesController < ApplicationController

	def index
		@courses = current_lecturer.courses
	end

	def print
		@counter =1;
		@course = Course.find_by(ccode:params[:attendance][:course])
		@reg = Registration.where("course_id == ? AND session == ?", @course.id, current_session)
		@reg_students = []
		if @reg.nil?
		else
			@reg.each do|reg| 
				@reg_students.push reg.student
			end
		end
	end
	
end