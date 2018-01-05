class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :ordernumber
      t.string :description

      t.timestamps
    end

    add_index :orders, :ordernumber, unique: true
  end
end
