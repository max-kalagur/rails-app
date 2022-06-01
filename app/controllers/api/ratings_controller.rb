class Api::RatingsController < ApplicationController
    before_action :authenticate_user!
    # POST /api/save-rating.json
    def save
        current_user.ratings.where(movie_id: rating_params[:movie_id]).each { |rating| rating.destroy }
        @rating = current_user.ratings.create(rating_params)
        
        respond_to do |format|
            if @rating.save
                format.html do
                    redirect_to '/'
                end
                format.json { render json: { rating: @rating, movie_avg: @rating.movie.avg_rating } }
            else
                format.html { render 'new'}
                format.json { render json: @rating.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def rating_params
      params.permit(:movie_id, :rating)
    end
end
