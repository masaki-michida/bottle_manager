class Customer < ApplicationRecord
  has_many :nicknames
  has_many :customer_bottles
  has_many :bottles,through: :customer_bottles
end
