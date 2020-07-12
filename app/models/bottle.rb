class Bottle < ApplicationRecord
  has_many :customer_bottles
  has_many :customers,through: :customer_bottles
  belongs_to :kind_of_alchol
end
