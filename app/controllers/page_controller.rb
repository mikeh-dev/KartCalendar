class PageController < ApplicationController
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

	def about
	end

	def privacy
	end
end
