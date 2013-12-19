class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :pass
      t.string :address
      t.string :deposit_address

      t.timestamps
    end
  end
end
