class RemoveTypeFromDiscs < ActiveRecord::Migration[6.1]
  def change
    remove_column :discs, :type, :string
  end
end
