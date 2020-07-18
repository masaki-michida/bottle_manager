class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      
      t.integer :local_number
      t.string :name
      t.string :furigana
      t.string :furiroma
      t.integer :karaoke_customer
      t.text :features
      t.integer :status, index: true
      t.datetime :birthday

      t.timestamps
    end
  end
end
