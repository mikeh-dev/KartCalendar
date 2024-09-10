class FollowChampionshipEventsService
  def initialize(user:, championship:)
    @user = user
    @championship = championship
  end

  def call
    # Fetch IDs of events already followed by the user to avoid duplicates
    already_followed_event_ids = @user.follows.where(followable_type: 'Event').pluck(:followable_id)

    # Select events from the championship that are not already followed
    event_ids_to_follow = @championship.events.where.not(id: already_followed_event_ids).pluck(:id)

    # Prepare the follow records to be inserted
    new_follows = event_ids_to_follow.map do |event_id|
      { user_id: @user.id, followable_type: 'Event', followable_id: event_id, created_at: Time.now, updated_at: Time.now }
    end

    # Bulk insert new follows if there are any
    Follow.insert_all(new_follows) if new_follows.any?
  end
end

# I used this service to follow all events in a championship for a user.