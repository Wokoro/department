class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include AdminsessionsHelper
  include StudentsessionsHelper
end
