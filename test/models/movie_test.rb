require "test_helper"

class MovieTest < ActiveSupport::TestCase
  test "should generate slug" do
    @title = 'Test Movie'
    @category = categories(:one)
    @movie = Movie.create({title: @title, text: 'test', category_id: @category.id})
    assert_equal @title.parameterize, @movie.slug
  end
  test "should count AVG rating" do
    @movie = movies(:one)
    @user = users(:two)
    @movie.ratings.create({rating: 8, user_id: @user.id})
    @movie.ratings.create({rating: 5, user_id: @user.id})
    assert_equal 6.5, @movie.avg_rating
  end
end
