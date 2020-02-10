Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :pizza_type
  resources :option
  resources :size
  resources :order
end
