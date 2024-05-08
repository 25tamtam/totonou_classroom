Rails.application.routes.draw do
  root "totonous#index"
  devise_for :users
  
  resources :totonous
  resources :posts do
    resources :post_comments, only: [:create, :destroy, :show, :edit, :update] # editとupdateを追加
  end
  
  resources :users do
    resources :posts, only: [:index, :destroy]
  end
  
  namespace :admin do
    resources :posts, only: [:index] do
    resources :post_comments, only: [:create, :destroy, :show, :edit, :update] # :editと:updateを追加
  end
  end
  
  patch '/admin/posts/:post_id/post_comments/:id/edit', to: 'post_comments#update', as: :update_post_comment

  get '/detail1.html', to: 'totonous#detail1'

  get '/shoulder_pain', to: 'pages#shoulder_pain'
end
  
