Rails.application.routes.draw do

  devise_for :admins, controllers: {
  	sessions: 'admin/admins/sessions',
  	registrations: 'admin/admins/registrations',
  }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :recipes, only: [:index, :show]
  end

  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations',
  }

  scope module: :public do
    root 'home#top'
    get 'home/about' => 'home#about'
    resources :users, only: [:show, :edit, :update]
    resources :recipes do
      resource :favorites, only: [:create, :destroy]
    end

  end



end
