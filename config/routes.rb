Rails.application.routes.draw do
  namespace :admins_ativo do
    resources :aquisicaos
  end
  namespace :admins_ativo do
    resources :admins
    resources :tipos
    resources :areas
    resources :subareas
    resources :condicaos
    resources :situacaos
    resources :ativos
    get 'search', to: 'search#ativos'
    resources :vinculos
    resources :usuarios
    resources :marcas
  end

  namespace :admins_ativo do
    get 'welcome/index'
  end
  
  devise_for :admins

  root to: 'admins_ativo/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
