class ProductController < ApplicationController

  def index
    @products = Product.all

    # Búsqueda
    if params[:search].present?
      @products = @products.where("name LIKE :search OR description LIKE :search", search: "%#{params[:search]}%")
    end

    # Ordenamiento
    if params[:sort].present?
      @products = @products.order(params[:sort])
    end
  end

  def new
    @product = Product.new
  end
  
  def show
    @products = Product.all
      render json: @products
  end
    
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to explora_path, notice: 'Producto creado con éxito.'
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

    @product.destroy
    redirect_to my_legos_path, notice: 'Producto eliminado con éxito.'
  end
  

  def my_legos
    @products = current_user.products
  end

  def edit
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :image, :set)
  end
end
