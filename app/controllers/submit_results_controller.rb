class SubmitResultsController < ApplicationController
    def index
        @courses = current_lecturer.courses
        @counter = 1;
    end

    def select_course
    end

    def scores
        @course = Course.find_by(id:params[:course][:course_id])
        @stud_info = Student.select(:id, :matno).where("session==? AND status==?", current_session, 1)
    end

    def edit_results
    end
    

end
