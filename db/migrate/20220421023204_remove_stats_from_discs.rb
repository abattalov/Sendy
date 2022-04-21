class RemoveStatsFromDiscs < ActiveRecord::Migration[6.1]
  def change
    remove_column :discs, :stats, :string
  end
end
