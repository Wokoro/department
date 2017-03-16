class Lecturer < ApplicationRecord
	has_secure_password
	validates :staff_id, presence: true
	validates :password, presence: true
end
