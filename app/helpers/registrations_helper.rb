module RegistrationsHelper

	def previous_session
		current_session = Util.where("name = ? ", "session").first.value
		first = ((current_session[0..3]).to_i - 1).to_s
		second = ((current_session[5..8]).to_i - 1).to_s
		previous_session = first+"/"+second
	end

	def current_session
		current_session = Util.find_by(name: 'session').value
	end
end