Rails.application.routes.draw do
  get 'departsite/news'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'departsite#index';
end
