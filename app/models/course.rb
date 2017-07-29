class Course < ApplicationRecord
	has_many :course_allocations
	has_many :lecturers, through: :course_allocations

	has_many :registrations
	has_many :students, through: :registrations
	has_many :assignments, through: :lecturers

	#enum semester: [:first_sem, :second_sem]
	#enum level: [:one, :two, :three, :four, :five]
end