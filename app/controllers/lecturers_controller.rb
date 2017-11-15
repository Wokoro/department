class LecturersController < ApplicationController

	def new
	    @lectuer = Lecturer.new()
	end

	def index
	end

	def create
		path_to_profile_pic = "#{Rails.root}/profile_images/"

		lect_phone_num = params[:lecturer][:phone_num]
		lect_staff_id = params[:lecturer][:staff_id]
		lect_fname = params[:lecturer][:fname]
		lect_staff_id = params[:lecturer][:staff_id]
		lect_sname = params[:lecturer][:sname]
		lect_state_of_origin = params[:lecturer][:state_of_origin]
		lect_lga = params[:lecturer][:lga]
		lect_nationality = params[:lecturer][:nationality]
		lect_religion = params[:lecturer][:religion]
		lect_email = params[:lecturer][:email]
		lect_sex = params[:lecturer][:sex].to_i
		@lect_passport_file = params[:lecturer][:passport]

		if(@lect_passport_file)
			@lect_passport_file_name = @lect_passport_file.original_filename
			@file_extn = File.extname @lect_passport_file_name
			@new_file_name = path_to_profile_pic+lect_staff_id.gsub('/', '_')+@file_extn
		end
		

		@lecturer = Lecturer.new(staff_id: lect_staff_id, phone: lect_phone_num, fname: lect_fname, sname: lect_sname, state_of_origin: lect_state_of_origin, lga: lect_lga, nationality: lect_nationality, religion: lect_religion, email: lect_email, sex: lect_sex, passport: @new_file_name)
		if @lecturer.save

			@secure_login = gen_login_details(@lecturer.id, @lecturer.staff_id)

			if(File.exist? @new_file_name)
				File.delete @new_file_name
				@file = File.new(@new_file_name,'w+b')
				@file.write(@lect_passport_file.read)
				@file.close
			else
				@file = File.new(@new_file_name,'w+b')
				@file.write(@lect_passport_file.read)
				@file.close
			end
			render plain: "REGISTRATION SUCESSFULL YOUR DEFAULT PASSWORD IS : "+@secure_login
		else
			render plain: 'REGISTRATION FAILED'
		end
	end

	def edit
	end

	private
		def gen_login_details(lecturer_table_id, staff_id)
			user_id = staff_id
			user_type = 1
			user_activation_status = 0
			@user_password =  SecureRandom.hex(10)
			login_detail = LoginDetail.create(user_id: lecturer_table_id, user_name: user_id, user_type: user_type, activation: user_activation_status, password: @user_password, password_confirmation: @user_password)
			return @user_password
		end
end