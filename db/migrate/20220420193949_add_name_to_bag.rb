class AddNameToBag < ActiveRecord::Migration[6.1]
  def change
    add_column :bags, :name, :string
  end
end
