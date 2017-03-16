class AdminsController < ApplicationController

  def new
  end

  def create
  	@admin = Admin.new(argument)
  	if @admin.save
  		render plain: 'registered'
  	end
  end

  def edit
  end

  private
          def argument
            params.require(:admin).permit(:name, :password)
          end
end