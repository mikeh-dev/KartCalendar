module TracksHelper
  def html_link_to(track)
    img_url = track.main_image.attached? ? url_for(track.main_image) : asset_path("placeholder.webp")
    next_event = track.next_race_event
    next_race_meeting_date = next_event ? next_event.start_date.strftime("%A %d %B %Y") : "No upcoming races"


    tag.div(class: "bg-white rounded-lg") do
      safe_join([
        image_tag(img_url, alt: "#{track.name} image", class: ""),
        tag.h3(track.name, class: "text-lg font-bold text-gray-900 mt-2"),
        tag.div(class: "flex items-center") do
          safe_join([
            image_tag('icons/outline/map-pin.svg', width: '24', height: '24', class: 'mr-2'),
            tag.p(track.location, class: "text-sm text-gray-700")
          ])
        end,
        tag.p(tag.strong("Phone:") + " #{track.contact_number}", class: "text-sm text-gray-700"),
        tag.p("Next Race Meeting:", class: "text-sm text-gray-700 mt-2 font-bold"),
        tag.p(" #{next_race_meeting_date}", class: "text-sm text-gray-700"),

        link_to('View Track', track_path(track), class: "btn btn-primary mt-2 w-full text-center")
      ])
    end
  end
end