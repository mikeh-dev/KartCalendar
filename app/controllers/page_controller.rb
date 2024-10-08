class PageController < ApplicationController

	def integrations
		render layout: 'admin'
	end

	def home
		@tracks_count = Rails.cache.fetch('tracks_count', expires_in: 1.month) do
			Track.count
		end
		@events_count = Rails.cache.fetch('events_count', expires_in: 1.month) do
			Event.count
		end
		@championships_count = Rails.cache.fetch('championships_count', expires_in: 1.month) do
			Championship.count
		end
	end

	def contact
		
	end


	def team
		render layout: 'admin'
	end

	def billing
		render layout: 'admin'
	end

	def notifications
		render layout: 'admin'
	end

	def settings
		render layout: 'admin'
	end

	def activity
		render layout: 'admin'
	end

	def profile
		render layout: 'admin'
	end

	def people
		render layout: 'admin'
	end

	def calendar
		render layout: 'admin'
	end

	def assignments
		render layout: 'admin'
	end

	def message
		render layout: 'admin'
	end

	def messages
		render layout: 'admin'
	end

	def project
		render layout: 'admin'
	end

	def projects
		render layout: 'admin'
	end

	def dashboard
		render layout: 'admin'
	end

	def pricing
	end

	def about
	end

	def privacy
		
	end
end
