Ultimatejoke::Application.routes.draw do

    root to: 'static_pages#home'

    resources :jokes
    put '/jokes/:id/:action' => 'jokes#upvote'
	put '/jokes/:id/:action' => 'jokes#downvote'
 
end
