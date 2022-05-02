class RemoveDiscnamesFromBags < ActiveRecord::Migration[6.1]
  def change
    remove_column :bags, :disc_names, :string
  end
end
