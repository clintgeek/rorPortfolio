Rails.application.routes.draw do
  root 'sites#index'

  resources :sites

  get 'admin' => 'sites#admin'

end
