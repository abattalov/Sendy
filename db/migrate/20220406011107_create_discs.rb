class CreateDiscs < ActiveRecord::Migration[6.1]
  def change
    create_table :discs do |t|
      t.string :brand
      t.string :type
      t.string :plastic
      t.string :stats
      t.string :weight
      t.integer :bag_id

      t.timestamps
    end
  end
end
