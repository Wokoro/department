class AssignmentSubmission < ApplicationRecord
	belongs_to :student
	belongs_to :assignment
end
