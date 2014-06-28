require 'test_helper'
class ProductsControllerTest < ActionController::TestCase
  test "should get product by id" do
    get :index, id: 1, :format => :json
    assert_response :success
  end
end