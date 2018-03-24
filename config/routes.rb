Rails.application.routes.draw do
 resources :movies
 post 'movies/search_tmdb'
end
