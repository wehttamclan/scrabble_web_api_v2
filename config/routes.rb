Rails.application.routes.draw do
  root "welcome#index"

  get '/sentence_examples', to: 'sentence_examples#index'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
end
