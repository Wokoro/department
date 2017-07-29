class StudentOthername < ApplicationRecord
	belongs_to :student
	validates :othernames, presence: true, length: {minimum: 3}
end