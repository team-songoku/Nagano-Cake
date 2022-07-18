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
   resources :items
   resources :customers, only: [:edit] 
   resources :cart_items
   resources :orders
   resources :shipping_addresses
 end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


namespace :admin do
   resources :items
   resources :orders
   resources :genres
end


end
