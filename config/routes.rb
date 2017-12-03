Rails.application.routes.draw do

  get 'courses/index'

  get 'courses/show'

  get 'courses/edit'

  get 'courses/delete'

  get 'courses/update'

  get 'courses/create'

  get 'admin_activities/course'

  get 'admin_activities/lecturer'

  get 'admin_activities/student'

  get 'admin_activities/session_activities'
  
  #routes for news
  post '/create_news', to: 'news#create'
  post '/search_news', to: 'news#search'
  post '/delete_news', to: 'news#delete'
  post '/update_news', to: 'news#update'
  post '/preview_news', to: 'news#preview'
  
	
  
  #routes for lecturers 
  post '/create_lecturer', to: 'lecturers#create'
  post 'delete_lecturer', to: 'lecturers#delete'
  post '/edit_lecturer', to: 'lecturers#update'
  post '/search_lecturer', to: 'lecturers#search'
  get '/print_lecturer_password', to: 'lecturers#print_passwords'
  
  #routes for students
  post '/create_student', to: 'students#create'
  post '/edit_student', to: 'students#update'
  post '/delete_student', to: 'students#delete'
  post '/search_student', to: 'students#search'
  get '/print_student_password', to: 'students#print_passwords'

  #routes for courses
  post '/search_course', to: 'courses#search'
  post '/create_course', to: 'courses#create'
  post '/update_course', to: 'courses#update'
  post '/delete_course', to: 'courses#delete'

  #routes for admin activities
  post '/query_code', to: 'admin_activities#checkcode'
  get '/admin_index', to: 'admin_activities#index'
  get '/admin_dashboard', to: 'admin_activities#dashboard'
  get '/admin_student', to: 'admin_activities#student'
  get '/admin_course', to: 'admin_activities#course'
  get '/admin_lecturer', to: 'admin_activities#lecturer'
  get '/admin_news', to: 'admin_activities#news'
  get '/admin_session_activities', to: 'admin_activities#session_activities'

  #routes for attendance controller
  get '/course_attendance', to: 'attendances#index'
  post '/print_attendance', to: 'attendances#print'


  #routes for lectrurer results submission
  post '/scores', to: 'submit_results#scores'
  get '/submit_results', to: 'submit_results#index'
  post '/submit_results', to: 'submit_results#create'
  post '/edit_scores', to: 'submit_results#edit_scores'
  post '/edit_all_scores', to: 'submit_results#edit_all_scores'

  #routes for student to check results
  get '/check_results', to: 'results#check_results'
  post '/results', to: "results#view_student_results"

  #routes for creating user details
  get '/login_details', to: 'create_user_login_details#new'
  post '/login_details', to: 'create_user_login_details#create'
  #routes for users login
  get '/user_login', to: 'login_sessions#new'
  post '/user_login', to: 'login_sessions#create'

  #routes for admin login
  #get '/admin_index', to: 'adminsessions#index'
 # get '/admin_login', to: 'adminsessions#new'
 # post '/admin_login', to: 'adminsessions#create'
  delete '/admin_delete', to: 'adminsessions#destroy'
  
  #routes for student login
  #get '/student_login', to: 'studentsessions#new'
  #post '/student_login', to: 'studentsessions#create'
  delete '/student_logout', to: 'studentsessions#destroy'

  #routes for lecturer login
  get '/lecturer_login', to: 'lecturersessions#new'
  post '/lecturer_login', to: 'lecturersessions#create'
  delete '/lecturer_logout', to: 'lecturersessions#destroy'


  get '/visit_library', to: 'lectureractivities#library'
  get '/lecturer_notification', to: 'lecturersessions#notification'
  get '/lecture_timetable', to: 'lectureractivities#timetable'
  post '/upload', to: 'lectureractivities#upload'

  #routes for student course enrolement
  get '/create', to: 'registrations#create'
  get '/registrations', to: 'registrations#index'

  #routes for student to download and submit assignment
  post '/assignment_submit', to: 'assignment_submissions#submit'
  get '/assignment_getassignment', to: 'assignment_submissions#setassign'
  post '/assignment_getassignment', to: 'assignment_submissions#getassign'

  #routes for lecturer to create and download assignment
  post '/assignment', to: 'assignments#new'
  get '/all_assign_courses', to: 'assignments#index2'
  post '/get_assignment', to: 'assignments#getassign'

  #routes for time table
  post'/settimetable', to: 'admin_activities#set_time_table'
  get'/gettimetable', to: 'admin_activities#get_time_table'


  resources :admins
  resources :lecturers
  resources :assignment_submissions
  resources :assignments
  resources :students
  resources :news
  resources :registrations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #These routes define the site navigation
  root 'departsite#index'
  get '/home', to: 'departsite#index'
  get '/about', to: 'departsite#about'
  get '/about', to: 'departsite#about'
  get '/alumni', to: 'departsite#alumni'

  get '/student_login', to: 'studentsessions#new'
  get '/lecturer_login', to: 'lecturersession#new'

  
end