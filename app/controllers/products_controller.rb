class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_product, only: [:show, :edit, :destroy, :update]

  def index
    @products = Product.all
  end

  def show
    @product.update(:views => @product.views + 1)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price)
    end

    def set_product
      @product = Product.find(params[:id])
    end

end

