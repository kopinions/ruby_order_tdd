class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  respond_to :json
  def index
    @products = Product.all()
  end

  def create
    product_create = Product.new(product_params)
    product_create.save()
    response.status = 201
    response.location = product_url product_create
    render :nothing => true
  end

  def show
    @product = Product.find(params[:id])
  end


  def record_not_found
    response.status = 404
  end

  private
    def product_params
      params.permit(:name)
    end
end