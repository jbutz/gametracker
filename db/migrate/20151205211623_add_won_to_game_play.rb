class AddWonToGamePlay < ActiveRecord::Migration
  def change
    add_column :game_plays, :won, :boolean
  end
end
