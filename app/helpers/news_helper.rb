module NewsHelper
	def next_news(current_id)
		current_id = current_id.to_i
		last_id = News.last
		last_id = last_id.id
		next_id = current_id
		if next_id < last_id
			next_id = next_id + 1
		else
			next_id = 1
		end
		return Digest::MD5::hexdigest(next_id.to_s)
	end

	def previous_news(current_id)
		current_id = current_id.to_i
		first_id = News.first
		first_id = first_id.id
		next_id = current_id
		if next_id > first_id
			next_id = next_id - 1
		else
			next_id = News.last.id
		end
		return Digest::MD5::hexdigest(next_id.to_s)
	end

	def get_distinct_years()
		news = News.all

		if news.empty?
			return nil
		else
			years = Array.new
			years[0] = news[0].year.to_s
			current_index=0;
			news.each do |y|
				yr = y.year.to_s
				if yr != years[current_index].to_s
					years.push(yr)
					current_index = current_index +1;
				end
			end

			years = years.sort
			min_year = years.first
			max_year = years.last
			diff = max_year.to_i - min_year.to_i
			year = min_year

			distinct_years = Array.new
			distinct_years[0] = min_year
			diff.times do|i|
				year = year.to_i + 1
				distinct_years.push(year)
			end

			return distinct_years.reverse
		end
	end
end
