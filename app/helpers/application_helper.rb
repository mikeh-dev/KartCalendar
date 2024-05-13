module ApplicationHelper

  def follow_id_for(followable)
    current_user.follows.find_by(followable: followable)&.id
  end

  def random_default_image
    images = Dir.glob('random/*', base: Rails.root.join('app', 'assets', 'images'))
    ActionController::Base.helpers.asset_path(images.sample)
  end

  def svg_icon
    raw('<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" class="w-4 h-4">
          <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3"></path>
        </svg>')
  end
end