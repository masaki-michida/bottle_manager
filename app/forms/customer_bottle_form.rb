class CustomerBottleForm

  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :nickname_furigana
  attribute :local_number, :integer
  attribute :kind_of_alchol_id, :integer
  attribute :liquid_level, :integer
  attribute :karaoke, :integer
  attribute :status, :integer

  def save
    ActiveRecord::Base.transaction do
      bottle = Bottle.new(local_number: local_number,kind_of_alchol_id: kind_of_alchol_id,liquid_level: liquid_level,karaoke: karaoke,status: status)
      bottle.save!

      # 中間テーブルにボトルID入れてカスタマー作成した後にカスタマーに結びつくニックネームを作成して中間テーブルにカスタマーidを追加
      nickname_furigana.each do |n|
        add_bottle_id_junction_table = bottle.customer_bottles.create(bottle_id: bottle.id)
        customer = Customer.new(status: status)
        customer.save!
        customer.nicknames.build(name: n[0],furigana: n[1]).save!
        add_customer_id_bottle_id_junction_table = add_bottle_id_junction_table.update(customer_id: customer.id)
        add_customer_id_bottle_id_junction_table.save!
      end

    end

  end

end