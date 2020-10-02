Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'admin/admins/sessions',
  	registrations: 'admin/admins/registrations',
  }

  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations',
  }

  scope module: :public do
    root 'home#top'
    get 'home/about' => 'home#about'
    resources :users, only: [:show, :edit, :update]
    resources :recipes
  end



end
