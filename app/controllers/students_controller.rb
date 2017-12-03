class StudentsController < ApplicationController
	def create
	    @other_names = params[:create_student][:othernames]
	    @student = Student.new new_student_params
	    @student_other_names = StudentOthername.new othernames:@other_names

	    if @student.save 
			@password = gen_login_password @student
			if !(@other_names.blank?)
				@student_other_names.student = @student
				if !@student_other_names.save
					@student.destroy
				end
			end
	    end
		
		@counter = 1
		@_100_level_students = Student.where('level == ?', 100)
		@_200_level_students = Student.where('level == ?', 200)
		@_300_level_students = Student.where('level == ?', 300)
		@_400_level_students = Student.where('level == ?', 400)
		@_500_level_students = Student.where('level == ?', 500)
		
	    respond_to do|format|
	        format.html
	        format.js
	    end
	end

	
	def update
		@other_names = params[:edit_student][:othernames]
	    @student = Student.find_by(id:params[:edit_student][:id])
	    @student_other_names = @student.student_othername

	    if @student.update(edit_student_params) && !(@other_names.blank?)
			if @student_other_names.nil?
				student_othernames = StudentOthername.new othernames:@other_names
				student_othernames.student = @student
				student_othernames.save
			else
				@student_other_names.othernames = @other_names
				@student_other_names.save
			end
		else
			if !@student.student_othername.nil?
				@student.student_othername.destroy
			end
	    end
		
		@counter = 1
		@_100_level_students = Student.where('level == ?', 100)
		@_200_level_students = Student.where('level == ?', 200)
		@_300_level_students = Student.where('level == ?', 300)
		@_400_level_students = Student.where('level == ?', 400)
		@_500_level_students = Student.where('level == ?', 500)
		
	    respond_to do|format|
	        format.html
	        format.js
	    end
	end
	
	def delete
		@student = Student.find_by(id: params[:edit_student][:id])
		@student_login_detail = LoginDetail.where("user_id = ? AND user_type = ?", @student.id, @student.user_type).first
		if @student
			@student_login_detail.destroy
			@student.destroy
			respond_to do|format|
				format.js
			end
		end
		@counter = 1
		@_100_level_students = Student.where('level == ?', 100)
		@_200_level_students = Student.where('level == ?', 200)
		@_300_level_students = Student.where('level == ?', 300)
		@_400_level_students = Student.where('level == ?', 400)
		@_500_level_students = Student.where('level == ?', 500)
	end
	
	def search
		@param = params[:search][:student]
		@search_student = Student.where("phone LIKE ? OR email LIKE ? OR state_of_origin LIKE ? OR matno LIKE ? OR lga LIKE ? OR fname LIKE ? OR sname LIKE ?", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%");
		respond_to do|format|
			format.js
		end
	end
	
	def print_passwords
		@passwords = LoginDetail.select(:user_id, :password).where("user_type = ? AND activation = ?", 0, 0)
	end

end

def new_student_params
	params.require(:create_student).permit(:matno, :fname, :sname, :state_of_origin, :nationality, :lga, :sex, :email, :phone, :religion, :level)
end

def edit_student_params
	params.require(:edit_student).permit(:id, :matno, :fname, :sname, :state_of_origin, :nationality, :lga, :sex, :email, :phone, :religion, :level)
end

