class CreateChests < ActiveRecord::Migration
  def change
    create_table :chests do |t|
      t.integer :user_id
      t.decimal :price
      t.decimal :prize

      t.timestamps
    end
  end
end
