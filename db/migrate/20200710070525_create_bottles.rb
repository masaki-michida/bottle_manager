class CreateBottles < ActiveRecord::Migration[5.2]
  def change
    create_table :bottles do |t|

      t.integer :local_number, null: false
      t.references :kind_of_alchol, index: false, null: false
      t.integer :liquid_level
      t.integer :karaoke
      t.integer :status,index: true

      t.timestamps
    end
    add_foreign_key :bottles,:kind_of_alchols
  end
end
