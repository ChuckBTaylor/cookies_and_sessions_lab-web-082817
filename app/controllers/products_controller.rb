class ProductsController < ApplicationController
  before_action :set_products, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @cart = cart
  end

  def add
    cart << params[:cart][:item]
    redirect_to products_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(products_params)
    redirect_to product_path(@product)
  end

  def show
  end

  def edit
  end

  def update
    @products.update(products_params)
    redirect_to products_path(@products)
  end

  def destroy
    @products.destroy
    redirect_to productss_path
  end


  private


  def set_products
    @products = Product.find(params[:id])
  end

  def products_params
    params.require(:products).permit()
  end

end
