require "application_system_test_case"

class Admin::MoviesTest < ApplicationSystemTestCase
  setup do
    @admin_movie = admin_movies(:one)
  end

  test "visiting the index" do
    visit admin_movies_url
    assert_selector "h1", text: "Movies"
  end

  test "should create movie" do
    visit admin_movies_url
    click_on "New movie"

    click_on "Create Movie"

    assert_text "Movie was successfully created"
    click_on "Back"
  end

  test "should update Movie" do
    visit admin_movie_url(@admin_movie)
    click_on "Edit this movie", match: :first

    click_on "Update Movie"

    assert_text "Movie was successfully updated"
    click_on "Back"
  end

  test "should destroy Movie" do
    visit admin_movie_url(@admin_movie)
    click_on "Destroy this movie", match: :first

    assert_text "Movie was successfully destroyed"
  end
end
