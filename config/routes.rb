Ultimatejoke::Application.routes.draw do

  resources :users

    root to: 'static_pages#home'

    resources :jokes
    
    put '/jokes/:id/:action' => 'jokes#upvote'
	put '/jokes/:id/:action' => 'jokes#downvote'

    post '/login' => 'user_session#create'
    get '/login' => 'user_session#new'
    get '/logout' => 'user_session#destroy'
 
end
