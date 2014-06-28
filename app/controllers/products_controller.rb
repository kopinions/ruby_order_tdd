class ProductsController < ActionController::Base
  def index
    @products = Product.all()
    render "index"
  end
end