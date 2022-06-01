class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show ]

  def show
    @movies = @category.movies.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @category_options = Category.all
    render template: "movies/index"
  end

  private
    def set_category
      @category = Category.find_by slug: params[:slug]
    end

    def movie_params
      params.require(:category).permit(:title, :slug)
    end
end
