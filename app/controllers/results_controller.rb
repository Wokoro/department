class ResultsController < ApplicationController
	include ResultsHelper
	include StudentsHelper
	include LecturersHelper

	def upload_results
	end

	def check_results
	end

	def view_student_results
		level = params[:result][:level]
		semester = params[:result][:semester]

		@counter = 1

		@semester_gp = 0
		@semester_units = 0
		@gpa = 0.00

		@cumulative_gp = 0
		@cumulative_units = 0
		@cgpa = 0.00


		registration = Registration.where('year_of_study = ? AND student_id = ?', level, current_student.id)
		
		@semester_reg = []
		registration.each do|reg|
			if reg.course.semester.to_i == semester.to_i
				@semester_reg.push(reg)
				@semester_units += reg.units.to_i
				@semester_gp += get_grade_point reg
			end
		end

		all_registrations = Registration.where(student_id: current_student.id).where('year_of_study <= ?', level)
		registrations = []
		if semester.to_i == 1
			all_registrations.each do|reg|
				if (reg.course.semester == 2) and (reg.year_of_study == level.to_i)
				else
					registrations.push(reg)
				end
			end

			registrations.each do|reg|
				@cumulative_units += reg.units.to_i
				@cumulative_gp += get_grade_point reg
			end

		else
			all_registrations.each do|reg|
				@cumulative_units += reg.units.to_i
				@cumulative_gp += get_grade_point reg
			end
		end

		@gpa = @semester_gp/@semester_units
		@cgpa = @cumulative_gp/@cumulative_units

	end

	
end
