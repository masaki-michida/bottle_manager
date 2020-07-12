class Group < ApplicationRecord
  has_many :customers,through: :customer_groups
  has_many :customer_groups 
end
