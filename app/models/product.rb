class Product < ApplicationRecord
    validates :name, :description, :price, :quantity, presence:true
    validates :quantity, numericality: { greater_than: -1 }
end
