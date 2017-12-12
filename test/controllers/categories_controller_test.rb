require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get listing:string" do
    get categories_listing:string_url
    assert_response :success
  end

end
