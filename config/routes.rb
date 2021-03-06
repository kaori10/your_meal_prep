Rails.application.routes.draw do

  devise_for :admins, controllers: {
  	sessions: 'admin/admins/sessions',
  	registrations: 'admin/admins/registrations',
  }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get "unsubscribe"
        patch "unsubscribe"
      end
    end
    resources :recipes, only: [:index, :show] do
      resources :reviews, only: [:index, :destroy]
    end
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations',
  }

  scope module: :public do
    root 'home#top'
    get 'home/about' => 'home#about'
    resources :users, only: [:show, :edit, :update] do
       member do
        get "unsubscribe"
        patch "unsubscribe"
      end
    end
    get 'users/favorite/:id' => 'users#favorite', as: 'user_favorite'
    resources :recipes do
      resource :favorites, only: [:create, :destroy]
      resources :reviews, only: [:index, :create]
    end
    get 'recipes/genre/:id' => 'recipes#genre', as: 'recipes_genre'
    resources :genres, only: [:index]
  end

end
