class AddStatsToDiscs < ActiveRecord::Migration[6.1]
  def change
    add_column :discs, :speed, :integer
    add_column :discs, :glide, :integer
    add_column :discs, :turn, :integer
    add_column :discs, :fade, :integer
  end
end
