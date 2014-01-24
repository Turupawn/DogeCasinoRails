class AddMultiplierToChest < ActiveRecord::Migration
  def change
    add_column :chests, :multiplier, :integer
  end
end
