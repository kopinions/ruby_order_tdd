class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  # respond_to :json
  def index
    @products = Product.all()
    render "index"
  end

  def create
    product = params[:client]
    product_create = Product.create(product)
    response.status = 201
    response.location = url_for product_create
    render :nothing => true
  end

  def show
    @product = Product.find(params[:id])
    render "show"
  end


  def record_not_found
    response.status = 404
  end

end