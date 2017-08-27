class SubmitResultsController < ApplicationController
    def index
        @courses = current_lecturer.courses
        @counter = 1;
    end

    def select_course
    end

    def scores
        @counter = 1
        @course = Course.find_by(id:params[:course][:course_id])
        @stud_info = Student.select(:id, :matno).joins(:registrations).where("course_id == ? AND session == ? AND status == ?", @course.id, current_session, 1);
    end

    def create
        course_id = params[:scores][:course]
        ca_scores = params[:ca_score]
        exam_scores = params[:exam_score]
        reg = nil;
        ca_scores.each do|matno, score|
            student_id = Student.find_by(matno: matno).id
           reg = Registration.where("student_id == ? AND session == ? AND course_id == ? AND  status == ?", student_id, current_session, course_id, 1).first
            reg.C_A_score = score.blank? ? 0 : score.to_i
            reg.exam_score = exam_scores[matno].blank? ? 0 : exam_scores[matno].to_i
            if reg.C_A_score+reg.exam_score > 45 then
                reg.status = 'passed'
            else
                reg.status = 'failed'
            end
            reg.save
        end
        flash[:success] = "Results Successfully Submitted"
        redirect_to submit_results_path
    end

    def edit_scores
        @counter = 1
        @course = Course.find_by(id:params[:course][:course_id])
        @stud_info = Student.select(:id, :matno).joins(:registrations).select(:C_A_score, :exam_score).where("course_id == ? AND session == ? AND status > ?", @course.id, current_session, 0)
    end

    def edit_all_scores
        course_id = params[:scores][:course]
        ca_scores = params[:ca_score]
        exam_scores = params[:exam_score]
        reg = nil;
        ca_scores.each do|matno, score|
            student_id = Student.find_by(matno: matno).id
           reg = Registration.where("student_id == ? AND session == ? AND course_id == ? AND  status > ?", student_id, current_session, course_id, 0).first
            reg.C_A_score = score.blank? ? 0 : score.to_i
            reg.exam_score = exam_scores[matno].blank? ? 0 : exam_scores[matno].to_i
            if reg.C_A_score+reg.exam_score > 45 then
                reg.status = 'passed'
            else
                reg.status = 'failed'
            end
            reg.save
        end
        flash[:success] = "Results Successfully Edited"
        redirect_to submit_results_path
    end

    

end
