class OrdersController < ApplicationController
  before_action :set_order, only: [:create, :new]

  def index
    @orders = Order.all
  end

  def myorders
    @orders = current_user.orders
  end

  def new
    @cart = current_user.cart
  end

  def create
    @cart = current_user.cart
   
    @order.fill_fields(current_user)
    if @order.save
      current_user.cart.empty
      redirect_to products_path
    else
      raise @order.errors.messages.to_s
      render :new, status: :unprocessable_entity
    end
  end

  def set_order
    @order = Order.new
  end

  private
  def order_params
    params.require(:order).permit(:number, :status, :price)
  end


end
