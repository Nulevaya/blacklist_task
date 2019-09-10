class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :phone_number, null: false, unique: true
      t.text :description
      t.boolean :blacklisted, null: false, default: false

      t.timestamps
    end

    add_index :customers, :phone_number, unique: true
  end
end
