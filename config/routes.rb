Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

  # scope module: 'customers' do
  #   root 'items#top'
  #   resources :items, only: [:show, :index]
  #   get 'about' => 'items#about'
  # end


 namespace :customer do
   root 'items#top'
   resources :items
 end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


# root :to =>"homes#top"
# get "home/about"=>"homes#about"

end
