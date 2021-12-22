class Order < ApplicationRecord
  belongs_to :book

  attr_accessor :token

  with_options presence: true do
    validates :name
    validates :mail
    validates :phone_number
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 8000, less_than_or_equal_to: 9999999}
  validates :token, presence: true

end
