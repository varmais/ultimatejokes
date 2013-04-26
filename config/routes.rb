Ultimatejoke::Application.routes.draw do

  resources :users

    root to: 'static_pages#home'

    resources :jokes
    resources :user_session
    put '/jokes/:id/:action' => 'jokes#upvote'
	put '/jokes/:id/:action' => 'jokes#downvote'
 
end
