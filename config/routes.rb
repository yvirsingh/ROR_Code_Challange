Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :employees do
    member do
      
    end

    collection do
      get :top_employees
      get :tree_data
    end
  end
end
