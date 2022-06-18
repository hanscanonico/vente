class ApplicationController < ActionController::Base
    def current_cart
      if current_user.present?
        if current_user.cart.empty?
            current_user.cart.create!
        else
            current_user.cart
        end
      end
      current_cart = current_user.cart
    end
end
