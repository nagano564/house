Rails.application.routes.draw do

  resources :houses

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end

  resources :calculators do
    resources :user
  end

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'
  get 'welcome/lists'
  #root 'todo_lists#index'
  root 'welcome#index'

end
