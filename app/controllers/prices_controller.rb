class PricesController < ApplicationController
  before_action :set_price, only: [:show]
  include ActionController::UrlFor
  include Rails.application.routes.url_helpers

  def show
  end

  def index
    price_all = Price.all()
    @prices = price_all
    puts product_prices_url
  end

  private
    def set_price
      begin
        @price = Price.find(params[:id].to_i)
      rescue ActiveRecord::RecordNotFound
        response.status = 404
        render :nothing => true
      end
    end

  def record_not_found
    respond.status = 404
  end
end