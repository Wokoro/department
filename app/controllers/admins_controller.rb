class AdminsController < ApplicationController

  def new
  end

  def create
  	@admin = Admin.new(argument)
  	if @admin.save
      admin_password = gen_login_details(@admin.id, @admin.name)
  		render plain: 'registered'+admin_password
  	end
  end

  def edit
  end

  private
        def argument
            params.require(:admin).permit(:name)
        end
        def gen_login_details(admin_table_id, staff_id)
            user_id = staff_id
            user_type = 2
            user_activation_status = 1
            @user_password =  SecureRandom.hex(10)
            login_detail = LoginDetail.create(user_id: admin_table_id, user_name: user_id, user_type: user_type, activation: user_activation_status, password: @user_password, password_confirmation: @user_password)
            return @user_password
        end
end