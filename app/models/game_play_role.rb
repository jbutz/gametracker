class GamePlayRole < ActiveRecord::Base
  belongs_to :game_play
  belongs_to :game_role
  belongs_to :user
  
  def player_name
    self.user.blank? ? self.name : self.user.name
  end
  
end
