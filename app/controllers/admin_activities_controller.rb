class AdminActivitiesController < ApplicationController
  
  def index
  end

   def dashboard
    respond_to do|format|
        format.html{render layout:false}
        format.js
    end
   end

  def course
    @count = 0;
    @course = Course.all
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
