Rails.application.routes.draw do
  root to: 'coupons#index'
  get 'coupons/index'
  resource :coupons do
    member do
      get :upload
      post :syn_db
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
