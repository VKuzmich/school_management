Rails.application.routes.draw do


  root to: 'main#index'

  devise_for :users, path_names: { sign_in: 'login',
                                             sign_out: 'logout',
                                             password: 'secret',
                                             sign_up: 'registration' }

  scope :admin do
    devise_for :admins, controllers: { sessions: 'admin/admins/sessions'}
  end

  namespace :admin do
    root to: 'main#index'

    resources :teachers, except: :show
    resources :disciplines, except: :show
    resources :admins, except: :show

    resources :courses, except: :show do
      resources :lessons, except: :show
    end

    resources :lessons, only: [] do
      post :sort, on: :collection
    end

    namespace :api do
      namespace :lessons do
        resource :mass_update, only: :create
      end

      resources :lessons, only: [] do
        resources :tinymce_images, only: :create, owner: 'lesson'
      end
    end
  end
end
