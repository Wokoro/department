class RegistrationsController < ApplicationController

	def index
		
	end

	def new

		student = current_student
		@course_ids = []
		@level = student_level(student)

		#DELETE THIS INSTANCE VARIABLES NOT BEEN USED
		@fscc = Course.where(id: @course_ids).where(semester: 1)
		@sscc = Course.where(id: @course_ids).where(semester: 2)

		@first_semester_courses = Course.where(level: @level).where(semester: 1)
		@second_semester_courses = Course.where(level: @level).where(semester: 2)
		flash[:notice] = " REGISTRATION SUCCESSFUL"
	end

	def create

		@reg_courses = params.require(:course)
		
		student = current_student
		level = student_level(student)
		#get all the course ids for fialed and carryover courses last session for both semesters
		@rep_courses = student.registrations.select(:course_id).where(session: previous_session).where(status: [0,3])
		@current_courses = Course.select(:id).where(level: level)
		@all_courses = []

		@rep_courses.each do|reg|
			@all_courses.push(reg.course_id)
		end

		@current_courses.each do|course|
			@all_courses.push(course.id)
		end

		@courses_to_reg = []
		@reg_courses.each do|key, val|
			@courses_to_reg.push(val)
		end

		@all_courses.each do|course|
			if @courses_to_reg.include?(course.to_s)
				course_r = Course.find_by(id: course)
				reg = Registration.create(student_id: current_student.id, course_id: course, session: current_session, year_of_study: level, status: :reg, units: course_r.units)
			else
				course_r = Course.find_by(id: course)
				reg = Registration.create(student_id: current_student.id, course_id: course, session: current_session, year_of_study: level, status: :not_reg, units: course_r.units)

				flash[:alert] = "REGISTRATION SUCCESSFUL"
			end
		end
		redirect_to student_notification_path
	end

	def edit

	end

	def show

	end

	def update

	end
end
