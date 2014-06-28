class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  respond_to :json
  def index
    @products = Product.all()
  end

  def create
    product_create = Product.new
    product_create.id = nil
    product_create.name = params[:name]
    product_create.save()
    response.status = 201
    response.location = url_for product_create
    render :nothing => true
  end

  def show
    @product = Product.find(params[:id])
  end


  def record_not_found
    response.status = 404
  end

end