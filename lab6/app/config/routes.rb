Rails.application.routes.draw do
  root "reports#index"


  resources :reports do
    resources :marks
  end
end
