class CreateBags < ActiveRecord::Migration[6.1]
  def change
    create_table :bags do |t|
      t.string :disc_names
      t.integer :user_id
      t.integer :disc_id

      t.timestamps
    end
  end
end
