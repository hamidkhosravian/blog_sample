Rails.application.routes.draw do
  get '/apidoc' => redirect('/swagger/dist/index.html?url=/api_docs/open_api/blog_sample_openapi.json')

  namespace :api do
    namespace :v1 do
      resource :authentications, only: [], path: '' do
        collection do
          post :sign_up
          post :sign_in
        end
      end

      resources :articles do
        resources :comments
      end
    end
  end
end
