class ChangeWeightDataTypeForDiscs < ActiveRecord::Migration[6.1]
  
  def self.up
    change_table :discs do |t|
      t.change :weight, :integer
    end
  end

  def self.down
    change_table :discs do |t|
      t.change :weight, :string
    end
  end

end
