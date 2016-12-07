class WelcomeController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
  render html: "HELLO WORLD";    

  end

end
