class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.float :days_left
      t.float :annual_rate
      t.float :landed_rate
      t.float :gap_rate
      t.decimal :future_price
      t.decimal :spot_price
      t.integer :birth_mark

      t.timestamps
    end

    add_index :coins, :name
    add_index :coins, :days_left
    add_index :coins, :birth_mark
    add_index :coins, [:created_at, :days_left]
  end
end
