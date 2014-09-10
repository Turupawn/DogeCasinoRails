class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.integer :user_id
      t.decimal :amount

      t.timestamps
    end
  end
end
