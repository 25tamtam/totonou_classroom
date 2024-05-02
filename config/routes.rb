Rails.application.routes.draw do
  root "totonous#index"
  devise_for :users
  resources :totonous
  resources :posts do
    resources :post_comments, only: [:create, :destroy, :show]
  end
  
  resources :users do
  resources :posts, only: [:index, :destroy]
  end
  
  
  # 管理者用のルートを追加
  namespace :admin do
    resources :post_comments, only: [:new, :create]
  end

end
