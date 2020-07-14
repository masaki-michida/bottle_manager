class CustomerBottleForm

  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :nicknames
  attribute :local_number, :integer
  attribute :kind_of_alchol_id, :integer
  attribute :liquid_level, :integer
  attribute :karaoke, :integer
  attribute :status, :integer

  def save
    ActiveRecord::Base.transaction do
      bottle = Bottle.new(local_number: local_number,kind_of_alchol_id: kind_of_alchol_id,liquid_level: liquid_level,karaoke: karaoke,status: status)
      bottle.save!

      nicknames.each do |n|
        bottler = bottle.customer_bottles.create(bottle_id: bottle.id)
        customer = Customer.new(status: status)
        customer.save!
        customer.nicknames.build(name: n).save!
        bottler.update(customer_id: customer.id)
        bottler.save!
      end



    end
  end

end