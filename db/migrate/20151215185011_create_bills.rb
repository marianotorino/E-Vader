class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.float :amount
      t.text :description
      t.date :date
      t.references :person, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
