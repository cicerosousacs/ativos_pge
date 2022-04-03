Rails.application.routes.draw do
  namespace :admins_ativo do
    resources :admins
    resources :tipos
    resources :areas
    resources :subareas
    resources :condicaos
    resources :situacaos
    resources :ativos do
      collection do
        match :vincular_deposito, via: %i[get post]
        get :vincular_deposito
      end
    end
    resources :aquisicaos
    resources :vinculos
    resources :usuarios
    resources :marcas
    resources :aquisicao_modalidades
    resources :aquisicao_origems
  end

  namespace :admins_ativo do
    get 'welcome/index'
  end
  
  devise_for :admins

  root to: 'admins_ativo/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
