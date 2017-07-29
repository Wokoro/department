module ResultsHelper
	def get_grade_point reg
		#course_score = reg.C_A_score.to_i + reg.exam_score.to_i
		course_unit = reg.units.to_i
		return points(reg) * course_unit
	end

	def grade_letter reg
		score = reg.C_A_score.to_i + reg.exam_score.to_i
		if score >= 70
			return "A"
		elsif score >= 60
			return "B"
		elsif score >= 50
			return "C"
		elsif score >= 45
			return "D"
		else 
			return "F"
		end
	end

	def points reg
		score = reg.C_A_score.to_i + reg.exam_score.to_i
		if score >= 70
			return 5
		elsif score >= 60
			return 4
		elsif score >= 50
			return 3
		elsif score >= 45
			return 2
		else 
			return 0
		end
	end

	def remark reg
		score = reg.C_A_score.to_i + reg.exam_score.to_i
		if score >= 45
			return "PASS"
		else 
			return "FAIL"
		end
	end
end
