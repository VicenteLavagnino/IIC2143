class HomeController < ApplicationController
  def index
  end

  def explora
    @products = Product.all
  end

  def nosotros
  end
  
  def trabaja
  end

  def reporta
  end

end
