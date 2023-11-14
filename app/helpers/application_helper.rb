module ApplicationHelper
  def follow_id_for(followable)
    current_user.follows.find_by(followable: followable)&.id
  end
end
