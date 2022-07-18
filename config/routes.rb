Rails.application.routes.draw do

  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  get 'orders/new'
  get 'orders/comfirm'
  get 'orders/index'
  get 'orders/complete'
  get 'orders/show'
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'shipping_addresses/index'
  get 'shipping_addresses/edit'
  get 'cart_items/index'
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

 namespace :customer do
   root 'items#top'
   resources :items
 end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
   resources :items
 end


 root :to =>"homes#top"
 get "home/about"=>"homes#about"

end
