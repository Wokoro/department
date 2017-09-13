class CoursesController < ApplicationController
	
	def index
		query = params[:query]
		list_course = Course.pluck(:ccode)
	respond_to {
		|format|
		if(query=="")
			format.json
			format.html{render :nothing => true}
			format.js{render :nothing => true}
		else
			$up=query.upcase
			res = list_course.select{
			|x|
			 (x=="p"||x.include?($up))
			}
			format.json{render json: res.to_json}
			format.html{render :nothing => true}
			format.js{render :nothing => true}
		end
	}
	end

	def create
		ccode = params[:ccode]
		ctitle = params[:ctitle]
		units = params[:units]
		level = params[:level]
		semester = params[:semester]
		@course = Course.create(ccode: ccode, ctitle: ctitle, units: units, level: level, semester: semester);
		respond_to do |format|
			format.json { render json:  @course }
      		format.js { render :nothing => true }
      		format.html { render :nothing => true }
		end
	end

	def edit

	end
end
