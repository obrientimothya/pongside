Pongside::Application.routes.draw do
  resources :banners

  resources :players

  resources :games

  resources :tables

  resources :matches do
    member do
      get :set_running
      get :set_over
      get :change_ends
      get :switch_service
      get :adjust_score
      get :create_game
      get :toggle_card
    end
  end

  root to: "matches#index"
end
