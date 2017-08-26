class AssignmentSubmission < ApplicationRecord
	belongs_to :student
	belongs_to :assignment
	belongs_to :lecturer through: assignments
end
