class CreateCustomerGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_groups do |t|

      t.references :customer, index: false,foreign_key: true
      t.references :group, index: false,foreign_key: true

    end
  end
end
