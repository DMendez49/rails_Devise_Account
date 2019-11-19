class Account < ApplicationRecord
  belongs_to :user

  validates :cost,
  numericality: {
    greater_than_or_equal_to: 25,
    message: "Mustbe at least $1"
 }
end
