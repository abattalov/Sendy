class AddDiscNameToDiscs < ActiveRecord::Migration[6.1]
  def change
    add_column :discs, :disc_name, :string
  end
end
