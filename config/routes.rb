Ultimatejoke::Application.routes.draw do

    root to: 'static_pages#home'

    resources :jokes
 
end
