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

  #routes for courses
  post '/find_course', to: 'courses#edit'
  post '/edit_course', to: 'courses#edit'
  post '/create_course', to: 'courses#create'
  post '/fnd_course', to: 'courses#show_del'
  post '/update_course', to: 'courses#update'
  post '/delete_course', to: 'courses#delete'

  #routes for admin activities
  get '/admin', to: 'admin_activities#dashboard'
  get '/admin_student', to: 'adimin_activities#student'
  get '/admin_course', to: 'admin_activities#course'
  get '/admin_lecturer', to: 'admin_activities#lecturer'
  get '/admin_news', to: 'admin_activities#news'
  get '/admin_session_activities', to: 'admin_activities#session_activities'

  #routes for attendance controller
  get '/course_attendance', to: 'attendances#index'
  post 'print_attendance', to: 'attendances#print'


  #routes for lectrurer results submission
  post '/scores', to: 'submit_results#scores'
  get '/submit_results', to: 'submit_results#index'
  post '/submit_results', to: 'submit_results#create'
  post '/edit_scores', to: 'submit_results#edit_scores'
  post '/edit_all_scores', to: 'submit_results#edit_all_scores'

  #routes for student to check results
  get '/check_results', to: 'results#check_results'
  post '/results', to: "results#view_student_results"

  #routes for admin login
  #get '/admin_index', to: 'adminsessions#index'
  get '/admin_login', to: 'adminsessions#new'
  post '/admin_login', to: 'adminsessions#create'
  delete '/admin_delete', to: 'adminsessions#destroy'
  
  #routes for student login
  get '/student_login', to: 'studentsessions#new'
  get '/student_notification', to: 'studentsessions#notification'
  post '/student_login', to: 'studentsessions#create'
  post '/student_logout', to: 'studentsessions#destroy'

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

  #news routes
  get '/add_news', to: 'news#new'

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