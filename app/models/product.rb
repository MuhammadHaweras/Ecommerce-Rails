class Product < ApplicationRecord
  belongs_to :category

  has_many :stocks
  has_many :order_products

  has_many_attached :images

end
