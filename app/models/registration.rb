class Registration < ApplicationRecord
	belongs_to :student
	belongs_to :course
	#enum year_of_study: [:year1, :year2, :year3, :year4, :year5]
	enum status: ["not_reg", "reg", "passed", "failed"]
end
