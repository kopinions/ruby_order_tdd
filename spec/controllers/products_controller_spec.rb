require "rails_helper"

describe ProductsController do
  render_views
  describe "get all product" do
    it "has a 200 status code" do
      get :index, :format => :json
      expect(response.status).to eq(200)
    end
  end

  describe "create product" do
    it "should create a product" do
      post :create, {:format => :json, :product => {:name => "name"}}
      expect(response.status).to eq(201)
      expect(response.location).to end_with("/products/1")
    end
  end

  describe "find product by id" do
    it "should return 404 when not find a product" do
      get :show, :id => 1, :format => :json
      expect(response.status).to eq(404)
    end

    it "should return 200 when find a product" do
      Product.stub(:find).with("1").and_return(Product.new(:name => "name", :id => 1))
      get :show, :id => 1, :format => :json
      expect(response.status).to eq(200)
      product_detail = JSON.parse(response.body)
      expect(product_detail["name"]).to eq("name")
    end
  end
end