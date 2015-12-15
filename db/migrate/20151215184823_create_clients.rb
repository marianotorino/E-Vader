class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.integer :dni
      t.string :gender
      t.date :birthdate
      t.string :cuit

      t.timestamps null: false
    end
  end
end
