Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    scope module: :v1, :path => "v1" do
    #post '/users'  => 'users#create'
    resources :users do
    	resources :posts
    end
     end
  end

	
end
