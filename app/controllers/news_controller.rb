class NewsController < ApplicationController
	 skip_before_action :verify_authenticity_token
	def update
		@id = params[:edit_news][:id]
		@heading = params[:edit_news][:heading]
		@body = params[:edit_news][:content]
		@image = params[:edit_news][:image]
		
		@news = News.find_by(id: @id)
		@news_image = @news.news_image
		@news.title = @heading
		@news.content = @body
		
		if @news.save
			if !@image.blank?
				upload_news_image(@image, @news.id)
			end
		end
		respond_to do|format|
			format.js
		end
	end
	
	def preview
		respond_to do|format|
			format.js
		end
	end
	
	#Important method
	def create
		@news = News.new();
		last_news = News.last()
		
		if last_news == nil
			current_news_id = 1
		else
			last_id = last_news.id
			current_news_id = last_id.to_i + 1
		end
		@news.title = params[:create_news][:heading]
		@news.content = params[:create_news][:content]
		@news_image = params[:create_news][:image]
		@news.enc_id = Digest::MD5::hexdigest(current_news_id.to_s)
		@news.year = Time.now.year
		
		if @news.save && @news_image
			upload_news_image(@news_image, @news.id)
		end
		
		respond_to do|format|
			format.js
		end
	end
	
	#important method
	def show
		@news_date = Time.new
		request_id = params[:id].to_s
		if request_id.length > 4
			@news = News.find_by_enc_id(params[:id])
			@news_date = @news.created_at
			@cont = @news.content.split("\n")
		else
			@news = News.where(year:params[:id])
			@news = @news.reverse
			render 'section'
		end
	end

	def delete
		@news_id = params[:edit_news][:id]
		@news = News.find_by(id: @news_id)
			if @news.news_image
				delete_news_image @news_id
			end
		@news.destroy
		@news = News.all
		
		respond_to do|format|
			format.js
		end
	end

	def search
		@query = params[:search][:news]
		@searched_news = News.where("title LIKE ? OR content LIKE ?", "%"+@query+"%", "%"+@query+"%")
		@news = News.all
	end

	#Important method
	def index
		@all_news = News.all();
		
		if @all_news.empty?
			render 'layouts/no_news'			
		else
			@all_news = @all_news.reverse
		end
	end
	
	def upload_news_image(file, news_id)
		uploaded_io = file
		news = News.find_by(id: news_id)
		new_file_name = news.enc_id+File.extname(uploaded_io.original_filename)
		news_im = news.news_image
		if news_im
			delete_news_image news.id
			File.open( Rails.root.join('public/news', new_file_name), 'wb') do | file | 
				file.write( uploaded_io.read)
			end
			news_im.path = new_file_name
			news_im.save
		else
			File.open( Rails.root.join('public/news', new_file_name), 'wb') do | file | 
				file.write( uploaded_io.read)
			end
			news_im = NewsImage.new
			news_im.news_id = news.id
			news_im.path = new_file_name
			news_im.save
		end
	end
	
	def delete_news_image(id)
		news = News.find_by(id: id)
		img = news.news_image.path
		if !img.blank?
			file = Rails.root.join("public/news/"+img)
			File::delete(file)
		end
	end
	
end