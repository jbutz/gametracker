class AddWonToGamePlayRole < ActiveRecord::Migration
  def change
    add_column :game_play_roles, :won, :boolean
  end
end
