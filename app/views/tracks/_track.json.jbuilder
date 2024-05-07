json.extract! track, :longitude, :latitude, :name, :address, :location
json.main_image_url track.main_image.attached? ? url_for(track.main_image) : asset_path("placeholder.webp")
json.tooltip html_link_to(track)