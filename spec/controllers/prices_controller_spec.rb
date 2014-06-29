require "rails_helper"

describe PricesController do
  render_views
  describe "get price by id" do
    it 'should get return 200' do
      expect(Price).to receive(:find).with(2).and_return(Price.new(:price=> 100, :id=>2))
      get :show, {:format => :json, :id=> 2, :product_id=> 1}
      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body["price"].to_f).to eq(100.0)
    end

    it 'should get return 404 when not found price' do
      expect(Price).to receive(:find).with(2).and_raise(ActiveRecord::RecordNotFound)
      get :show, {:format => :json, :id=> 2, :product_id=> 1}
      expect(response.status).to eq(404)
    end
  end
end