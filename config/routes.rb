Rails.application.routes.draw do
  
	get 'privacy', to: 'page#privacy'
	get 'about', to: 'page#about'
	get 'home', to: 'page#home'
	get 'cookie', to: 'page#cookie'

	resources :dashboard, only: [:index] do
		collection do
			get :check
		end
	end

	resources :engines do
		resources :service_records do
			member do
				delete :remove_engine_service_record_image, to: 'service_records#remove_image', as: :remove_image
			end
		end
		
		member do
			delete :remove_image
		end
	end

	resources :contacts, only: [:new, :create]
	
  if Rails.env.development? || Rails.env.test?
    mount Railsui::Engine, at: "/railsui"
  end

  root action: :home, controller: "page"

  devise_for :users

	resources :events do
		collection do
			get :check
			get	:check_race
			get :check_test
		end
	end
	
	resources :tracks
	resources :championships
	resource :calendars, only: [:show]
	resources :follows, only: [:create, :destroy]

	get '*unmatched_route', to: 'application#not_found', constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage'
	}

end
