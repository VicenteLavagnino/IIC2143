class ProductController < ApplicationController
  def show
    @products = Product.all
      render json: @products
  end
    
  def create
    @product = Product.new(product_params)
      if @product.save
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
  end

  def filter
    @products = Product.where("id = ?", params[:id])
      render json: @products 
  end
    
  def destroy
    @product = Product.find(params[:id])
    if @product
      @product.destroy

    end
  end


  def product_params
    params.require(:product).permit(:name, :description, :image, :set)
  end
end
