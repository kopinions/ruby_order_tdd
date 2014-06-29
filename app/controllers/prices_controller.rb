class PricesController < ApplicationController
  before_action :set_price, only: [:show]
  def show
  end

  def index
    @prices = Price.all()
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