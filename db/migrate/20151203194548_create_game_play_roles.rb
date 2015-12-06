class CreateGamePlayRoles < ActiveRecord::Migration
  def change
    create_table :game_play_roles do |t|
      t.references :game_play, index: true, foreign_key: true
      t.references :game_role, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
