Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get :copy, to: 'copy_base#copy'
  get 'copy/:key', to: 'copy_base#key_specified_value'
  get :refresh, to: 'copy_base#refresh'
end
