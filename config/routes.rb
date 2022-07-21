Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}


 scope module: :customer do
   root :to =>"homes#top"
   get "homes/about"=>"homes#about"
   get 'customers/mypage' => 'customers#show'
   get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
   patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
   resources :items
   resources :cart_items, only: [:index,:create,:update,:destroy] do
     collection do
       delete 'destroy_all'
     end
   end
   resources :orders, only: [:new,:index,:show,]
   resources :customers, only: [:edit,:update,:destroy]
   resources :shipping_addresses, only: [:index,:create,:edit,:update,:destroy]
 end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


namespace :admin do
   resources :items, only: [:new,:index,:create,:show,:edit,:update,:destroy]
   resources :orders, only: [:index,:create,:edit,:update]
   resources :genres, only: [:index,:create,:edit,:update,:destroy]
   resources :customers, only: [:index, :show, :edit, :update]
end


end
