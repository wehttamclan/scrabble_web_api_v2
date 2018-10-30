Rails.application.routes.draw do
  root "welcome#index"

  get '/sentence_examples', to: 'sentence_examples#index'
end
