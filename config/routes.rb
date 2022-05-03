Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :user, only: [:show, :update, :destroy], param: :uid do
        member do
          post :change_password
        end
        collection do
          post :login
          get :logout
          get :profile
          get :role
        end
      end

      namespace :admin do
        resources :user, param: :uid do
          member do
            get :ban
            get :unban
          end
          collection do
            get :list_patient
            get :list_doctor
            get :count_user
            post :create_doctor
            post :create_patient
          end
        end
      end

      namespace :doctor do
        resources :schedule_time, only: [:create, :destroy], param: :uid do
          collection do
            get :schedule_time_of_date
          end
        end
        resources :booking_time do
        end
        resources :prescription, param: :uid do
          collection do
            get :show_by_patient
          end
        end
      end

      namespace :patient do
        resources :schedule_time, param: :uid do
          collection do
            get :find_doctor
            get :available_time
          end
        end
        resources :booking_time do
          collection do
            post :booking
          end
        end
        resources :user do
          collection do
            get :list_doctor
          end
        end
        resources :prescription, param: :uid do
          collection do
            get :show_by_booking
          end
        end
      end
    end
  end
end
