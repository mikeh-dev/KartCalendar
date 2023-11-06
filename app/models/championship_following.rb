class ChampionshipFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :championship
end
