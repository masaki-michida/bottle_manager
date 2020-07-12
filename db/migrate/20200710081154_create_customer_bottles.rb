class CreateCustomerBottles < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_bottles do |t|

      t.references :customer ,foreign_key: true, index: false
      t.references :bottle ,foreign_key: true, index: false

    end
  end
end
