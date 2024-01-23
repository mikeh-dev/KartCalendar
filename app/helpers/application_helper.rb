module ApplicationHelper
  def follow_id_for(followable)
    current_user.follows.find_by(followable: followable)&.id
  end

  def random_default_image
    images_directory = Rails.root.join('app', 'assets', 'images', 'random')
    images = Dir.children(images_directory)
    "/assets/random/#{images.sample}"
  end
end