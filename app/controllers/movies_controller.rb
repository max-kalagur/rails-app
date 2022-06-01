class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @category_options = Category.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find_by slug: params[:slug]
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :text, :category_id)
    end
end
