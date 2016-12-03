Rails.application.routes.draw do
  root to: 'coupons#index'
  get 'coupons/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
