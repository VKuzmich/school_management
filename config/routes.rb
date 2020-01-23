Rails.application.routes.draw do

  scope :admin do
    devise_for :admins, controllers: { sessions: 'admin/admins/sessions'}
  end

  namespace :admin do
    root to: 'main#index'

    resources :teachers, except: :show
    resources :disciplines, except: :show
    #resources :admins, except: :show

    resources :courses, except: :show do
      resources :lessons, except: :show
    end

    resources :lessons, only: [] do
      post :sort, on: :collection
    end
  end
end
