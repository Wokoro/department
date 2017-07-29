class AssignmentsController < ApplicationController
	def index
		lecture = current_lecturer
		@courses = lecture.courses
	end

	def new
		assign_id = params[:course_id]
		@course = Course.find_by(id: assign_id)

	end

	def create
		
		
		
		file_path = path
		#Assignment.create()
		
	end

	def path
		lecture_id = current_lecturer.id

		file = params[:assign][:file]

		file_name = file.original_filename

		file_ext = File.extname file_name

		$assign_file = "assignment_1#{file_ext}"

		ccode_id = params[:course_id]

		ccode = Course.find_by(id: ccode_id).ccode

		semester = Course.find_by(ccode: ccode).semester
		
		session = Util.find_by(name: 'session').value.gsub(/[ \/ ]/, '_')
	
		lect_path = "#{Rails.root}/public/lecturer/#{session}/semester_#{semester}/#{ccode}"

		stu_path = "#{Rails.root}/public/student/#{session}/semester_#{semester}/#{ccode}/"

		


		if Dir.exist? lect_path
			len = Dir[File.join("#{lect_path}",'*')].count{|f| File.file?(f)}
			$assign_file = "assignment_#{len+1}#{file_ext}"
		else

			FileUtils.mkdir_p(lect_path)
			FileUtils.mkdir_p(stu_path)

		end

		
		path = "#{lect_path}/#{$assign_file}"
		created_file = File.new(path, 'wb')

		created_file.write(file.read)
		created_file.close
		Assignment.create(lecturer_id: lecture_id, course_id:  ccode_id, session: session, assignment_path: stu_path, file: path)
	end
end