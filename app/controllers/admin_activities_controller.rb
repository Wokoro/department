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
	@lecturer = Lecturer.all
    respond_to do|format|
        format.html{render layout:false}
        format.js
    end
  end

 def lecturer
	@counter = 1
	@lecturers = Lecturer.all
    respond_to do|format|
		format.js
    end
  end

  def student
	@counter = 1
	@_100_level_students = Student.where('level == ?', 100)
	@_200_level_students = Student.where('level == ?', 200)
	@_300_level_students = Student.where('level == ?', 300)
	@_400_level_students = Student.where('level == ?', 400)
	@_500_level_students = Student.where('level == ?', 500)
	
    respond_to do|format|
		format.js
    end
  end

  def session_activities
    respond_to do |format|
      format.js
      format.html{render layout:false}
    end
  end

  def news
	@news = News.all
	respond_to do|format|
		format.js
    end
  end

  def checkcode
    @response =""
    @query = params[:query]
    Course.find_by(ccode: @query) ? @response = true : @response = false
    respond_to do |format|
      format.js
      format.html{render layout:false}
      format.json{render json: @response.to_json}
    end
    return @response
  end

  def set_time_table
    value = params[:value]
    day = params[:day]
    per = params[:period]
    row = params[:row].to_i
    path = "#{Rails.root}/public/time_table/time_table.json"
    file = File.new(path, 'r')
    data = JSON.parse(File.read(file))
    file.close
    if data
      data[day][per][row] = value
      temp = data.to_json
      file = File.new(path,"w")
      if file.write(temp)
        file.close
      end
    else

    end
  end

  def get_time_table
    path = "#{Rails.root}/public/time_table/time_table.json"
    file = File.new(path, 'r')
    data = File.read(file)
    file.close
    respond_to do |format|
      format.json{render json: data}
    end
  end 
end
