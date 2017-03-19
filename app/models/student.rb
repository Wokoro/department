class Student < ApplicationRecord
	has_secure_password
	validates :matno, presence: true
	validates :password, presence: true

end