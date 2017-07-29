module AdminsessionsHelper

	def login_admin(admin)
		session[:admin_id] = admin.id
	end

	def current_admin

		@current_admin = Admin.find_by(id: session[:admin_id])

	end

	def logged_in?
		!current_admin.nil?
	end

	def logout_admin
		session.delete(:admin_id)
		@current_admin = nil
	end

end