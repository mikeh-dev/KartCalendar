# app/helpers/tracks_helper.rb
module TracksHelper
  def html_link_to(track)
    img_url = track.main_image.attached? ? url_for(track.main_image) : asset_path("placeholder.webp")
    ActionController::Base.helpers.tag.div(class: "bg-white rounded-lg") do
      ActionController::Base.helpers.safe_join([
        ActionController::Base.helpers.image_tag(img_url, alt: "#{track.name} image", class: ""),
        ActionController::Base.helpers.tag.h3(track.name, class: "text-lg font-bold text-gray-900 mt-2"),
        ActionController::Base.helpers.tag.p(track.location, class: "text-sm text-gray-700"),
        ActionController::Base.helpers.link_to('View Track', track_path(track), class: "btn btn-primary mt-2 w-full text-center")
      ])
    end
  end
end
