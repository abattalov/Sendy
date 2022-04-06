class CreateScorecards < ActiveRecord::Migration[6.1]
  def change
    create_table :scorecards do |t|
      t.string :course
      t.string :date
      t.string :strokes
      t.string :score
      t.integer :user_id

      t.timestamps
    end
  end
end
