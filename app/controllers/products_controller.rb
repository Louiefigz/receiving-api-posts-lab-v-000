class ProductsController < ApplicationController
  def index
    @products = Product.all
  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
     render json: @product, status: 201
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
