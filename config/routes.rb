Rails.application.routes.draw do
  
	get 'admin/integrations', to: 'page#integrations'
	get 'team', to: 'page#team'
	get 'admin/billing', to: 'page#billing'
	get 'admin/notifications', to: 'page#notifications'
	get 'admin/settings', to: 'page#settings'
	get 'admin/activity', to: 'page#activity'
	get 'admin/profile', to: 'page#profile'
	get 'admin/people', to: 'page#people'
	get 'admin/calendar', to: 'page#calendar'
	get 'admin/assignments', to: 'page#assignments'
	get 'admin/message', to: 'page#message'
	get 'admin/messages', to: 'page#messages'
	get 'admin/project', to: 'page#project'
	get 'admin/projects', to: 'page#projects'
	get 'admin/dashboard', to: 'page#dashboard'
	get 'pricing', to: 'page#pricing'
	get 'about', to: 'page#about'
	get 'home', to: 'page#home'
	get 'dashboard', to: 'dashboard#index'

	get 'contact', to: 'page#contact', as: 'contact'  # For displaying the contact form
	post 'contact', to: 'contacts#create'             # For form submission
	
  if Rails.env.development? || Rails.env.test?
    mount Railsui::Engine, at: "/railsui"
  end

  root action: :home, controller: "page"

  devise_for :users
	resources :events
	resources :tracks 
	resources :championships


	get 'categories/search', to: 'categories#search', as: 'search_categories'
  post 'categories/find_events', to: 'categories#find_events', as: 'find_category_events'

	resources :follows, only: [:create, :destroy]

	get 'test_events', to: 'events#test_events', as: 'test_events'
	get 'race_events', to: 'events#race_events', as: 'race_events'

	get '*unmatched_route', to: 'application#not_found', constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage'
	}

end
