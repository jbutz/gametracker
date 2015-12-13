class CreateWinConditions < ActiveRecord::Migration
  def change
    create_table :win_conditions do |t|
      t.string :name
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
