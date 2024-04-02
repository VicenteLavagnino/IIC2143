class MovieController < ApplicationController
    
    # Part 3
      
    def director_rankings
      @movie = Movie.find(params[:movie_id])
      @director = @movie.director
      @director_rankings = @director.rankings
      render json: @director_rankings
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Movie not found' }, status: :not_found
    end

end
  