require "test_helper"

class Admin::MoviesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @movie = movies(:one)
    @category = categories(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get admin_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_movie_url
    assert_response :success
  end

  test "should create admin_movie" do
    assert_difference("Movie.count") do
      post admin_movies_url, params: { movie: { title: 'new', text: 'test', category_id: @category.id, preview: nil } }
    end

    assert_redirected_to admin_movie_url(Movie.last)
  end

  test "should show admin_movie" do
    get admin_movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_movie_url(@movie)
    assert_response :success
  end

  test "should update admin_movie" do
    patch admin_movie_url(@movie), params: { movie: { title: 'new', text: 'test', category_id: @category.id, preview: nil } }
    assert_redirected_to admin_movie_url(@movie)
  end

  test "should destroy admin_movie" do
    assert_difference("Movie.count", -1) do
      delete admin_movie_url(@movie)
    end

    assert_redirected_to admin_movies_url
  end
end
