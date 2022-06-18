class CartsController < ApplicationController
    before_action :authenticate_user!

    def show
        @cart = current_user.cart
    end

    def add_product_to_cart
        product = Product.find(params[:id])
        current_user.cart.add_product(product);
        @cart = current_user.cart; 
        redirect_to products_path
    end

    def remove_product_from_cart
        product = Product.find(params[:id])
        current_user.cart.remove_product(product);
        @cart = current_user.cart; 
        redirect_to carts_path
    end

    def index
        @cart = current_user.cart
    end
end
