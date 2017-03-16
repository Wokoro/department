class NewsController < ApplicationController

	def new
		@news = News.new();
	end

	def create
		@news = News.new();
		last_news = News.last()
		
		if last_news == nil
			current_news_id = 1
		else
			last_id = last_news.id
			current_news_id = last_id.to_i + 1
		end
		@news.title = params[:news][:title]
		@news.content = params[:news][:content]
		@news.enc_id = Digest::MD5::hexdigest(current_news_id.to_s)
		@news.year = Time.now.year
		@news.save();
		redirect_to news_path(@news.enc_id)
	end

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

	def destroy
	end

	def edit
	end

	def index
		@all_news = News.all();
		
		if @all_news.empty?
			render 'layouts/no_news'			
		else
			@all_news = @all_news.reverse
		end
	end
end