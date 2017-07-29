Rails.application.routes.draw do

  get '/check_results', to: 'results#check_results'

  post '/results', to: "results#view_student_results"

  get '/admin_login', to: 'adminsessions#new'
  post '/admin_login', to: 'adminsessions#create'
  delete '/admin_delete', to: 'adminsessions#destroy'
  
  get '/student_login', to: 'studentsessions#new'
  post '/student_login', to: 'studentsessions#create'
  delete '/student_delete', to: 'studentsessions#destroy'

  get '/lecturer_login', to: 'lecturersessions#new'
  post '/lecturer_login', to: 'lecturersessions#create'
  delete '/lecturer_delete', to: 'lecturersessions#destroy'

  get '/submit_result', to: 'lectureractivities#submit'
  get '/visit_library', to: 'lectureractivities#library'
  get '/lecture_timetable', to: 'lectureractivities#timetable'
  post '/upload', to: 'lectureractivities#upload'


  get '/create', to: 'registrations#create'
  get '/registrations', to: 'registrations#index'

  post '/r_level', to: 'registrations#reg_level'

  post '/assignment_submit', to: 'assignment_submissions#submit'
  get '/assignment_getassignment', to: 'assignment_submissions#setassign'
  post '/assignment_getassignment', to: 'assignment_submissions#getassign'

  post '/new_assignment', to: 'assignments#new'


  resources :admins
  resources :lecturers
  resources :assignment_submissions
  resources :assignments
  resources :students
  resources :news
  resources :registrations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get '/about', to: 'departsite#about'
  get '/alumni', to: 'departsite#alumni'

  get 'lectureractivities/addrow'
  post 'lectureractivities/addrow'

  root 'departsite#index'
  get '/home', to: 'departsite#index'
  get '/about', to: 'departsite#about'

  get '/student_login', to: 'studentsessions#new'
  get '/lecturer_login', to: 'lecturersession#new'
  get '/admin_login', to: 'adminsession#new'

  
end