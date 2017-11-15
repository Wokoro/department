class StudentsController < ApplicationController
	def index
	end

	def create
		path_to_profile_pic = "#{Rails.root}/profile_images/"

		stud_phone_num = params[:student][:phone_num]
		stud_matno = params[:student][:matno]
		stud_fname = params[:student][:fname]
		stud_matno = params[:student][:matno]
		stud_sname = params[:student][:sname]
		stud_state_of_origin = params[:student][:state_of_origin]
		stud_lga = params[:student][:lga]
		stud_nationality = params[:student][:nationality]
		stud_religion = params[:student][:religion]
		stud_email = params[:student][:email]
		stud_sex = params[:student][:sex].to_i
		stud_level = params[:student][:level]
		@stud_passport_file = params[:student][:passport]

		if(@stud_passport_file)
			@stud_passport_file_name = @stud_passport_file.original_filename
			@file_extn = File.extname @stud_passport_file_name
			@new_file_name = path_to_profile_pic+stud_matno.gsub('/', '_')+@file_extn
		end
		

		@student = Student.new(matno: stud_matno, phone: stud_phone_num, fname: stud_fname, sname: stud_sname, state_of_origin: stud_state_of_origin, lga: stud_lga, nationality: stud_nationality, religion: stud_religion, email: stud_email, sex: stud_sex, level: stud_level, passport: @new_file_name)
		if @student.save

			@secure_login = gen_login_details(@student.id, @student.matno)

			if(File.exist? @new_file_name)
				File.delete @new_file_name
				@file = File.new(@new_file_name,'w+b')
				@file.write(@stud_passport_file.read)
				@file.close
			else
				@file = File.new(@new_file_name,'w+b')
				@file.write(@stud_passport_file.read)
				@file.close
			end
			render plain: "REGISTRATION SUCESSFULL YOUR DEFAULT PASSWORD IS : "+@secure_login
		else
			render plain: 'REGISTRATION FAILED'
		end
	end
	def edit
	end

	def new
	end

	def show
		respond_to do |f|
			f.json{render :json}
		end
	end
	private
		def gen_login_details(stud_table_id, student_mat_num)
			user_id = student_mat_num
			user_type = 0
			user_activation_status = 0
			@user_password =  SecureRandom.hex(10)
			login_detail = LoginDetail.create(user_id: stud_table_id, user_name: user_id, user_type: user_type, activation: user_activation_status, password: @user_password, password_confirmation: @user_password)
			return @user_password
		end
end







