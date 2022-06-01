require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

end
