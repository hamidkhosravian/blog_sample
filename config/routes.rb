Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :authentications, only: [], path: '' do
        collection do
          post :sign_up
          post :sign_in
        end
      end
    end
  end
end
