class CustomerBottleForm

  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :new_nickname_furigana
  attribute :insert_existed_customer_id
  attribute :existed_customer_new_nickname
  attribute :existed_customer_new_group
  attribute :local_number, :integer
  attribute :kind_of_alchol_id, :integer
  attribute :liquid_level, :integer
  attribute :karaoke, :integer
  attribute :status, :integer

  def save

    ActiveRecord::Base.transaction do
      bottle = Bottle.new(local_number: local_number,kind_of_alchol_id: kind_of_alchol_id,liquid_level: liquid_level,karaoke: karaoke,status: status)
      bottle.save!

      if new_nickname_furigana
        new_nickname_furigana.each do |n|
          add_bottle_id_junction_table = bottle.customer_bottles.create(bottle_id: bottle.id)
          customer = Customer.new(status: status)
          customer.save!
          customer.nicknames.build(name: n[0],furigana: n[1]).save!
          add_bottle_id_junction_table.update(customer_id: customer.id)
        end
      end

      if insert_existed_customer_id
        insert_existed_customer_id.each do |c|
          bottle.customer_bottles.create(bottle_id: bottle.id,customer_id: c)
          if existed_customer_new_nickname
          end
          if existed_customer_new_group
          end
        end
      end

    end
  end

end