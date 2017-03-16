Rails.application.routes.draw do

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

  resources :admins
  resources :lecturers
  resources :students
  resources :news
    match '/index', to:'news#index', via: :post

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get '/about', to: 'departsite#about'
  get '/alumni', to: 'departsite#alumni'

  get 'lectureractivities/addrow'
  post 'lectureractivities/addrow'

  root 'departsite#index'
  
end