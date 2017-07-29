class AssignmentSubmissionsController < ApplicationController
	### NEXT PHASE IS TO ADD THE ASSIGNMENT COURSES IN A FORM LIKE FORM SO THAT A SELECTION OPTION WOULD BE MADE POSIBLE
	def index
		assignlist
	end

	def new
	end


	def submit
		@id = params[:assign][:assignment_id]
		@assignment = Assignment.find_by(id: @id)
		@course = Course.find_by(id: @assignment.course_id)
	end

	def create
		student = current_student
		matno = student.matno.gsub("/", '_')
		#path = Assignments.find_by(id: 1).assignment_path
		assign_num = params[:assignment_submission][:assignment_id]
		asspath = Assignment.find_by(id: assign_num).assignment_path
		path = asspath
		file = params[:assignment_submission][:upload]
		filename = params[:assignment_submission][:upload].original_filename


		#code = params.require(:assignment_submission).permit(:code)
		#ass_num = params.require(:assignment_submission).permit(:assignment_id)
		extn = File.extname filename

		file_path = path+matno+extn

		
		
	

		# FILE PROCESSING ASPECT

		#if File.exist? file_path
		#	old_ass = AssignmentSubmission.where('student.id=? AND assignment_id=?', current_student.id, assign_num)
		#	old_ass.destroy
		#	assign = File.new(file_path, "wb")
		#	AssignmentSubmission.create(student_id: student.id, assignment_id: assign_num)
		#	assign.write(file.read)
		#	assign.close
		#else
			AssignmentSubmission.create(student_id: student.id, assignment_id: assign_num)
			assign = File.new(file_path, "wb")
			assign.write(file.read)
			assign.close
		#end

		#file_cont = File.new(file.to_s, "r+")
		#@msg = []
		#if file_cont
		#	file_cont.each_byte {|c| msg.push(c)}
		#else
		#	@msg = ["noway"]
		#end
		#path = "public/assignment/session/semester1/gst100/assignment"
		#Dir.new(path)
		#matno = matno.gsub(/[/]/, '_')


		#tempfile = path+"temp.doc"

		#filename = matno

		#empty_file = File.open(tempfile,"w+")
		#empty_file.write

	end
	
	#FOR BETTER EFFICIENCY CONSIDER USING SAME TEMPLATE BUT VARRY THE TEMPLATE BASE ON THE ACTION THE REQUEST IS COMMING FROM
	def setassign
		assignlist
	end

	def getassign
		id = params[:assign][:assignment_id]
		assign = Assignment.find_by(id: id).file
		#pdf_filename = File.join(Rails.root, "public/event.pdf")
  		send_file(assign, disposition: 'inline', type: "application/pdf")
	end

	def getPath record
			@path = ""
			record.each do |r|
				@path = (r.file.to_s)
			end
			return @path
	end

	def getCourseNames names
			courseNames = []
			names.each do |n|
				courseNames.push(n.ccode)
			end
			return courseNames
	end

	def getRegCoursesIds record
			@courses = []
			record.each do |r|
				@courses.push(r.course_id)
			end
			return @courses
	end

		def getRegAssignmentIds record
			@courses = []
			record.each do |r|
				@courses.push(r.id)
			end
			return @courses
		end

		def getSubmits record
			@submits = []
			record.each do |assign|
				@submits.push(assign.assignment_id)
			end
			return @submits
		end

		def assignlist
			student = current_student
			stud_regs = student.registrations.where(session: current_session)
			arr_regcourses = getRegCoursesIds stud_regs

			#GET ALL THE ASSIGNMENTS THE STUDENT HAS SUBMITED AND GET THE IDs
			stud_assign_submits = student.assignment_submissions
			arr_submits = getSubmits stud_assign_submits

			#GET THE LIST OF ALL THE ASSIGNMENT GIVEN TO THE STUDENT AND GET THE IDs
			stud_assignments = Assignment.where(course_id: arr_regcourses)
			arr_assign = getAssignments stud_assignments
		
			waiting_assignment = activeAssignments arr_assign, arr_submits
		
			@ass_code = Assignment.where(id: waiting_assignment)
		end

		def getAssignments record
			@assign = []
			record.each do |assign|
				@assign.push(assign.id)
			end
			return @assign
		end

		def activeAssignments assignment, submitted
			@active = []
			assignment.select{  |s|
				if submitted.include?(s)
				else
					@active.push(s)
				end
			}
			return @active
		end
end
