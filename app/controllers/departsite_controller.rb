class DepartsiteController < ApplicationController
  def index
  	@images = Dir.glob("#{Rails.root}/app/assets/images/*.jpg");
	if !session[:new_visit]
		session[:new_visit] = true
		@visit = Util.where("name = ?", "site_visits").first
		@visit.value = @visit.value.to_i+1;
		@visit.save;
	end
  end
  def news
  end
  def about
  end
  def alumni
  end
end
