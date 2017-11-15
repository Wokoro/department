class LoginDetail < ApplicationRecord
	has_secure_password

	enum activation: [:inactive, :active]
end