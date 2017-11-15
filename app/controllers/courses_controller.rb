class CoursesController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @course = Course.find_by(ccode: params[:find_course][:ccode])
    if !@course
        flash.now[:error] = "This course does not exit"
    end
    respond_to do|format|
        format.js
    end
  end

  def show_del
    @course = Course.find_by(ccode: params[:fnd_course][:ccode])
    if !@course
        flash.now[:error] = "Course Does not exist"
    end
    respond_to do|format|
        format.js
    end
  end

  def delete
    @course = Course.find_by(ccode: params[:delete_course][:ccode])
    @val = nil
    if @course
        @val = @course.destroy!
        flash.now[:success] = "Course Deleted"
    end
    respond_to do|format|
        format.js
    end
  end

  def update
    cc = params[:edit_course][:ccode]
    ct = params[:edit_course][:ctitle]
    cs = params[:edit_course][:semester]
    cu = params[:edit_course][:unit]
    cl = params[:edit_course][:level]
    @course = Course.find_by(ccode: params[:edit_course][:old_ccode])
    @params = {ccode:cc, ctitle:ct, units:cu, level:cl, semester:cs}
    @course = @course.update! @params
    flash.now[:success] = "Update Successful"
    respond_to do|format|
        format.js
    end
  end

  def create
    cc = params[:create_course][:ccode]
    ct = params[:create_course][:ctitle]
    cs = params[:create_course][:semester]
    cu = params[:create_course][:unit]
    cl = params[:create_course][:level]

    @course = Course.find_by(ccode: cc)
    if @course
        flash.now[:error] = "This course already exists"
     else
        @params = {ccode:cc, ctitle:ct, units:cu, level:cl, semester:cs}
        test = cc.blank? || ct.blank? || cs.blank? || cu.blank? || cl.blank?
        if test
            flash.now[:error] = "All fields must be filled"
        else
            @course = Course.create! @params
            flash.now[:error] = "creation Successful"
        end
     end
    respond_to do|format|
        format.js
    end
  end

end

def course_create_params
    params.require(:create_course).allow(:ccode, :ctitle, :unit, :semester, :level)
end

def delete_course course
    return course.destroy
end