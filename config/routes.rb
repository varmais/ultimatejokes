Ultimatejoke::Application.routes.draw do

  resources :users

    root to: 'static_pages#home'

    resources :jokes
    
    put '/jokes/:id/:action' => 'jokes#upvote'
	put '/jokes/:id/:action' => 'jokes#downvote'

    post '/login' => 'user_sessions#create'
    get '/login' => 'user_sessions#new'
    get '/logout' => 'user_sessions#destroy'
 
end
