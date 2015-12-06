class AddUserIdToGamePlay < ActiveRecord::Migration
  def change
    add_column :game_plays, :user_id, :integer, :references => "users"
  end
end
