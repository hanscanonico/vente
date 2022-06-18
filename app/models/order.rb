class Order < ApplicationRecord
    has_and_belongs_to_many :products
    validates :number, presence: true
    belongs_to :user

    def fill_fields(current_user)
        self.status = "ordered"
        
        if Order.last.nil? 
            next_id = 1
        else
            next_id = Order.last.id + 1
        end
        self.number = "Order #{next_id}"
        self.products = current_user.cart.products
        self.price = current_user.cart.total_price
        self.user = current_user
    end

end
