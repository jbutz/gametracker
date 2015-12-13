class AddWinConditionToGamePlay < ActiveRecord::Migration
  def change
    add_reference :game_plays, :win_condition, index: true, foreign_key: true
  end
end
