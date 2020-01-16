Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'blogs#index'
  resources :blogs, except: :index
  get ':content', to: 'blogs#content', as: :diff_content

end
