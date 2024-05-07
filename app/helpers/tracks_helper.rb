module TracksHelper
  def html_link_to(track)
    link_to track.address, track_path(track), style: 'color: #000000'
  end
end
