Rails.application.routes.draw do
  devise_for :users
  root to: "crops#index"
  resources :crops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
