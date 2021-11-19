Rails.application.routes.draw do
  get 'advertisements', to: 'advertisements#index'
  get 'advertisements/show'
  get 'advertisements/new'
  get 'advertisements/edit'

  get 'brands/:brand_id/models', to: 'brands#get_models'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
