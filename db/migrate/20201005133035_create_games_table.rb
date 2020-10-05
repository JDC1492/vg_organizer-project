class CreateGamesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :console
      t.string :genre
      t.string :description
      t.boolean :complete, default: false
    end
  end
end
