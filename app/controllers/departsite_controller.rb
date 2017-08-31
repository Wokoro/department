class DepartsiteController < ApplicationController
  def index
  	@images = Dir.glob("#{Rails.root}/app/assets/images/*.jpg");
  end
  def news
  end
  def about
  end
  def alumni
  end
end
