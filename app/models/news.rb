class News < ApplicationRecord
	has_one :news_image, dependent: :destroy
end
