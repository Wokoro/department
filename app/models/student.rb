class Student < ApplicationRecord
	has_one :student_othername, dependent: :destroy
	
	has_many :registrations, dependent: :destroy
	has_many :courses, through: :registrations

	has_many :assignment_submissions, dependent: :destroy

	enum sex: [:male, :female]

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}+\z/i
	VALID_STRING_ONLY = /\A[A-Za-z]/

	validates :matno, presence: true
	validates :fname, presence: true, length: {minimum: 3}, format: {with: VALID_STRING_ONLY}
	validates :sname, presence: true, length: {minimum: 3}, format: {with: VALID_STRING_ONLY}	
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}
	
	validates :sex, presence: true
	validates :state_of_origin, presence: true, format: {with: VALID_STRING_ONLY}
	validates :nationality, presence: true, format: {with: VALID_STRING_ONLY}
	validates :religion, presence: true, format: {with: VALID_STRING_ONLY}
end