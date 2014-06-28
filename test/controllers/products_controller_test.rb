require 'test_helper'
class ProductsControllerTest < ActionController::TestCase
  test "should get product by id" do
    get :index, id: 1, :format => :json
    assert_response :success
  end


  test "should create a product when create" do
    post :create, {:format => :json, :product => {:name => "productName", :currentPrice => 1.1}}
  end
end
