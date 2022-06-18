class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy
	has_many :products, :through => :cart_items
    belongs_to :user

    def add_product(product)
       
        if cart_item=self.cart_items.find {|cart_item| cart_item.product == product}
            cart_item.qty = cart_item.qty + 1
            cart_item.save
        else
            cart_item = CartItem.new
            cart_item.qty = 1
            cart_item.product = product;
            self.cart_items.push(cart_item)
        end
        save
    end

    def remove_product(product)
        cart_item=self.cart_items.find {|cart_item| cart_item.product == product}
        cart_item.qty = cart_item.qty - 1
        if cart_item.qty==0
            cart_item.delete
        else
            cart_item.save
        end
        save
    end

    def empty
        self.cart_items = []
        save
    end

    def nb_products
        count = 0
        cart_items.each do |cart_item|
            count = count + cart_item.qty
        end
        count
    end

    def total_price
        total_price = cart_items.inject(0){ |total_price, cart_item| total_price +cart_item.product.price * cart_item.qty }
    end

end
