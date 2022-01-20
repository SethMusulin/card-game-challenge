Rails.application.routes.draw do
  root 'tables#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'deal', to: 'deals#deal'
    get 'deals', to: 'deals#deals'
  end
  get '*path', to: 'tables#home', via: :all
end
