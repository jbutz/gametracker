class RemoveWonFromGamePlay < ActiveRecord::Migration
  def change
    remove_column :game_plays, :won, :boolean
  end
end
