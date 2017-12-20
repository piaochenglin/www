class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.integer :sex
      t.string :address
      t.string :tel
      t.integer :active

      t.timestamps
    end
  end
end
