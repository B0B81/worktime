class CreateTimestamps < ActiveRecord::Migration[5.0]
  def change
    create_table :timestamps do |t|
      t.string :description
      t.integer :ordernumber
      t.date :begin_date
      t.time :begin_time
      t.date :end_date
      t.time :end_time
      t.references :user, foreign_key: true
      t.references :workfile, foreign_key: true

      t.timestamps
    end
  end
end
