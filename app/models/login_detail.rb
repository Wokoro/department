class LoginDetail < ApplicationRecord
	enum activation: [:inactive, :active]
end