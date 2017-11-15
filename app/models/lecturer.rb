class Lecturer < ApplicationRecord

	has_many :course_allocations
	has_many :courses, through: :course_allocations
	has_many :assignments, dependent: :destroy
	has_one :lecturer_othername

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_STRING_ONLY = /\A[A-Za-z]/i

	enum sex: [:male, :female]
	
	validates :staff_id, presence: true
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}
	validates :fname, presence: true, length: {minimum: 3}, format: {with: VALID_STRING_ONLY}
	validates :sname, presence: true, length: {minimum: 3}, format: {with: VALID_STRING_ONLY}	
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

end
