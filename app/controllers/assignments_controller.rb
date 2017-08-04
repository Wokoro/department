class AssignmentsController < ApplicationController

	def index
		lecture = current_lecturer
		@courses = lecture.courses
	end

	def index2
		@lecturer = current_lecturer
		@assigns = @lecturer.assignments.select(:id)
	end

	def new
		assign_id = params[:assign][:course_id]
		@course = Course.find_by(id: assign_id)
		flash[:notice] = "UPLOAD SUCCESSFUL"

	end

	def create
		
		
		
		file_path = path
		#Assignment.create()
		redirect_to assignments_path
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

		
		#REVISIT THIS CODE FOR BETTER IMPLEMENTATION

		if Dir.exist? lect_path
			len = Dir[File.join("#{lect_path}",'*')].count{|f| File.file?(f)}
			$assign_file = "assignment_#{len+1}#{file_ext}"
			FileUtils.mkdir_p(stu_path<<"assignment_#{len+1}/")
		else

			FileUtils.mkdir_p(lect_path)
			FileUtils.mkdir_p(stu_path<<"assignment_1/")

		end

		
		path = "#{lect_path}/#{$assign_file}"
		created_file = File.new(path, 'wb')

		created_file.write(file.read)
		created_file.close
		Assignment.create(lecturer_id: lecture_id, course_id:  ccode_id, session: session, assignment_path: stu_path, file: path)
	end

	def getassign
		assign_id = params[:assign][:assign_id]
		file_path = Assignment.find_by(id: assign_id).assignment_path
		folder = file_path.to_s[-13, 12]
		zipfile = "#{Rails.root}/tmp/#{folder}.zip"
		dir = Dir.new(file_path)
		if File.exist? zipfile
			File.delete("#{Rails.root}/tmp/#{folder}.zip")
		end
		Zip::File.open(zipfile, Zip::File::CREATE) {
 		|zipfile|
 		dir.each{
 			|f|
 		if ((f.eql?("."))||(f.eql?("..")))
 			
 		else
 			#file = File.open("new/#{f}", "rb")
 			zipfile.add("#{f}", "#{file_path}/#{f}")
 			zipfile.close
    	end
	}
	send_file("#{Rails.root}/tmp/#{folder}.zip")
}
	#redirect_to all_assign_courses_path
	end
end