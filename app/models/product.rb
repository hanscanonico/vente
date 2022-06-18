class Product < ApplicationRecord
    has_many :cart_items
	has_many :cart, :through => :cart_items
    has_and_belongs_to_many :orders

    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true

    validates :price, :numericality => { :greater_than => 0, :less_than_or_equal_to => 1000000 }
end
