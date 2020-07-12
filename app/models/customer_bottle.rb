class CustomerBottle < ApplicationRecord
  belongs_to :bottle
  belongs_to :customer
end
