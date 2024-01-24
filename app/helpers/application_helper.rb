module ApplicationHelper
  def follow_id_for(followable)
    current_user.follows.find_by(followable: followable)&.id
  end

  def random_default_image
    images = Dir.glob('random/*', base: Rails.root.join('app', 'assets', 'images'))
    ActionController::Base.helpers.asset_path(images.sample)
  end
end