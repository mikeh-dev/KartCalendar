Rails.application.routes.draw do
  
	get 'privacy', to: 'page#privacy'
	get 'about', to: 'page#about'
	get 'home', to: 'page#home'
	get 'cookie', to: 'page#cookie'
	get 'new_dash', to: 'dashboard#new_dash'
	get 'billing', to: 'page#billing'

	get 'calendar', to: 'page#calendar'

	resources :dashboard, only: [:index] do
		collection do
			get :check # Example route for fetching events via JS
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
	
	get 'categories/search ', to: 'categories#search', as: 'search_categories'
  post 'categories/find_events', to: 'categories#find_events', as: 'find_category_events'

	resources :follows, only: [:create, :destroy]

	get 'test_events', to: 'events#test_events', as: 'test_events'
	get 'race_events', to: 'events#race_events', as: 'race_events'

	get '*unmatched_route', to: 'application#not_found', constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage'
	}

end
