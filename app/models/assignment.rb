class Assignment < ApplicationRecord
	belongs_to :lecturer
	belongs_to :course
	has_many :assignment_submissions
end
