class CreateWorkfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :workfiles do |t|
      t.string :title
      t.text :description
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
