class AddDatetimeToScorecards < ActiveRecord::Migration[6.1]
  def change
    add_column :scorecards, :date, :datetime
  end
end
