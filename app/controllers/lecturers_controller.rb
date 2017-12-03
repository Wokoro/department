class LecturersController < ApplicationController
	def create
	    @other_names = params[:create_lecturer][:othernames]
	    @lecturer = Lecturer.new new_lecturer_params
	    @lecturer_other_names = LecturerOthername.new othernames:@other_names

	    if @lecturer.save
			@password = gen_login_password @lecturer
	        if !(@lecturer_other_names.blank?)
				@lecturer_other_names.lecturer = @lecturer
	            if !@lecturer_other_names.save
					@student.destroy
				end
	        end
	    end
				
	    respond_to do|format|
	        format.html
	        format.js
	    end
		@lecturers = Lecturer.all
	end
	
	def update
	    @other_names = params[:edit_lecturer][:othernames]
	    @lecturer = Lecturer.find_by(id:params[:edit_lecturer][:id])
	    @lecturer_other_names = @lecturer.lecturer_othername

	    if @lecturer.update(edit_lecturer_params) && !(@other_names.blank?)
			if @lecturer_other_names.nil?
				lecturer_othernames = LecturerOthername.new othernames:@other_names
				lecturer_othernames.lecturer = @lecturer
				lecturer_othernames.save
			else
				@lecturer_other_names.othernames = @other_names
				@lecturer_other_names.save
			end
		else
			if !@lecturer.lecturer_othername.nil?
				@lecturer.lecturer_othername.destroy
			end
	    end
		
	    respond_to do|format|
	        format.html
	        format.js
	    end
		@lecturers = Lecturer.all
	end
	
	
	
	def delete
		@lecturer = Lecturer.find_by(id: params[:edit_lecturer][:id])
		if @lecturer
			@lecturer.destroy
			respond_to do|format|
				format.js
			end
		end
		@lecturers = Lecturer.all
	end
	
	def search
		@param = params[:search][:lecturer]
		@search_lecturers = Lecturer.where("phone LIKE ? OR email LIKE ? OR state_of_origin LIKE ? OR staff_id LIKE ? OR lga LIKE ? OR fname LIKE ? OR sname LIKE ?", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%", "%"+@param+"%");
		respond_to do|format|
			format.js
		end
	end
	
	def print_passwords
		@passwords = LoginDetail.select(:user_id, :password).where("user_type = ? AND activation = ?", 1, 0)
	end
end

 
def new_lecturer_params
    params.require(:create_lecturer).permit(:staff_id, :sname, :fname, :sex, :state_of_origin, :lga, :nationality, :religion, :phone, :email)
end

def edit_lecturer_params
    params.require(:edit_lecturer).permit(:id, :staff_id, :sname, :fname, :sex, :state_of_origin, :lga, :nationality, :religion, :phone, :email)
end
