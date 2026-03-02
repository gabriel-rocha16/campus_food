Rails.application.routes.draw do
  resources :itens_vendas
  devise_for :users
  root "produtos#index"

  resources :produtos
  resources :clientes
  resources :funcionarios
  resources :vendas
  resources :item_vendas
end
