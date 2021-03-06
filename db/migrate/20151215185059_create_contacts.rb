class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :kind
      t.text :data
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
