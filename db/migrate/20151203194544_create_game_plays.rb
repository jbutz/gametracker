class CreateGamePlays < ActiveRecord::Migration
  def change
    create_table :game_plays do |t|
      t.references :game, index: true, foreign_key: true
      t.date :day
      t.string :name

      t.timestamps null: false
    end
  end
end
