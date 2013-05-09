Ultimatejoke::Application.routes.draw do

  resources :users

    root to: 'static_pages#home'

    resources :jokes
    resource :user_session
    
    put '/jokes/:id/:action' => 'jokes#upvote'
	put '/jokes/:id/:action' => 'jokes#downvote'

    post '/users/:id/promote_to_admin' => 'users#promote_to_admin', :as => :promote_to_admin
    post '/users/:id/demote_to_user' => 'users#demote_to_user', :as => :demote_to_user

    post '/login' => 'user_sessions#create'
    get '/login' => 'user_sessions#new'
    get '/logout' => 'user_sessions#destroy'
 
end
