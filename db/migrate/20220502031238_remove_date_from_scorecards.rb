class RemoveDateFromScorecards < ActiveRecord::Migration[6.1]
  def change
    remove_column :scorecards, :date, :string
  end
end
