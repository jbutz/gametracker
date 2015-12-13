class WinCondition < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_play
end
