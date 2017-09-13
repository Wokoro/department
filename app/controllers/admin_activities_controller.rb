class AdminActivitiesController < ApplicationController

   def dashboard
   end

  def course
    respond_to do|format|
        format.html{render layout:false}
        format.js
    end
  end

  def lecturer
  end

  def student
  end

  def session_activities
  end

  def news
  end
end
