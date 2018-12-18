Rails.application.routes.draw do
  get 'static_pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/games/answer/:id', to: 'games#answer' , via: 'get'
  root :to => "static_pages#home", :id => :home
  match '/games/check_answer/:id', to: 'games#check_answer' , via: 'put'
end
