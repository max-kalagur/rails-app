require "test_helper"

class Api::RatingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @movie = movies(:one)
  end

  test "should create rating" do
    sign_in users(:two)
    assert_difference("Rating.count") do
      post api_save_rating_url, params: { movie_id: @movie.id, rating: 9 }
    end
  end

  test "should not create rating" do
    assert_no_difference("Rating.count") do
      post api_save_rating_url, params: { movie_id: @movie.id, rating: 5 }
    end
  end

end
