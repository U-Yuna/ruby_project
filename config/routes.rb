Rails.application.routes.draw do
  #get "users/show"
  resource :session
  resources :passwords, param: :token
  get "home/index"
  get 'answers/create', to: 'answers#create', as: :submit_answers
  #get "users/mypage", to: 'users#show'
  resources :users, only: [:show]
  resources :quiz_sets do
    resources :questions, only: [:new, :create, :edit, :update, :destroy]

    member do
      get 'solve', to: 'answers#new'     # 解答画面（1つのクイズセットを解く）
      post 'submit', to: 'answers#create' # 回答送信・採点
    end
  end
  

  get "solve_list", to: "answers#list" # ← クイズを解く用の一覧ページ

  root "home#index" 
end
