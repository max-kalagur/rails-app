require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should generate slug" do
    @title = 'Test Category'
    @category = Category.create({title: @title})
    assert_equal @title.parameterize, @category.slug
  end
end
