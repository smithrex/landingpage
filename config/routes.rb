Rails.application.routes.draw do

  resources :rol_usuarios
  resources :rols
  resources :orden_entregas
  resources :orden_productos do
    member do
      put :update_cantidad
      get :delete_item
    end
  end  

  resources :orden_proyectos
  resources :ordens do
    collection do
      post :carrito
      get :carrito
      get :confirmar
    end
  end
  resources :clientes
  resources :productos do 
    member do
      get :comprar
    end
    collection do 
      get :filter
    end
  end
  
  resources :categoria
  devise_for :users
  resources :proyectos
  root "landpage#index"

  get 'admin/users', to: "landpage#users"
  
  get 'admin/users/:id/show', to: "landpage#users_show"
  get 'admin/users/:id/edit', to: "landpage#users_edit" 
  get 'admin/users/:id/destroy', to: "landpage#users_destroy"     
  
  get 'landpage/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
