class Admin::MoviesController < ApplicationController
  before_action do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /admin/movies or /admin/movies.json
  def index
    @movies = Movie.order(created_at: :desc)
    @category_options = Category.all.collect{|category| [category.title, category.id] }
  end

  # GET /admin/movies/1 or /admin/movies/1.json
  def show
  end

  # GET /admin/movies/new
  def new
    @movie = Movie.new
    @category_options = Category.all.collect{|category| [category.title, category.id] }
  end

  # GET /admin/movies/1/edit
  def edit
    @category_options = Category.all.collect{|category| [category.title, category.id] }
  end

  # POST /admin/movies or /admin/movies.json
  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to admin_movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/movies/1 or /admin/movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to admin_movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/movies/1 or /admin/movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to admin_movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find_by slug: params[:slug]
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :text, :category_id, :preview)
    end
end
