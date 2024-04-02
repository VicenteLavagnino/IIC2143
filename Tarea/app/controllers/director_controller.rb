class DirectorController < ApplicationController
  
    # Part 1
    
    def create
      @director = Director.new(director_params)
  
      if @director.save
        render json: @director, status: :created
      else
        render json: @director.errors, status: :unprocessable_entity
      end
    end
        
    private
        
    def director_params
      params.require(:director).permit(:name, :age, :country, :has_oscars)
    end
    
    def index
        @directors = Director.all
        render json: @directors
    end
    
    def show
      @director = Director.find(params[:id])
      render json: @director
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Director not found' }, status: :not_found
    end
    
    def destroy
      @director = Director.find(params[:id])
      @director.destroy
      head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Director not found' }, status: :not_found
    end
    
    def destroy_all
      Director.destroy_all
      head :no_content
    end
    
    def oscars
      @directors_with_oscars = Director.where(has_oscars: true)
      render json: @directors_with_oscars
    end
    
    # Part 2
    
    def movies
      @director = Director.find(params[:director_id])
      @movies = @director.movies
      render json: @movies
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Director not found' }, status: :not_found
    end
    
    def create_movie
      @director = Director.find(params[:director_id])
      @movie = @director.movies.build(movie_params)
      if @movie.save
        render json: @movie, status: :created
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Director not found' }, status: :not_found
    end
      
    private
    
    def movie_params
      params.require(:movie).permit(:title, :sinopsis, :duration, :premiere, :director)
    end
  
    def update_movie
      @director = Director.find(params[:director_id])
      @movie = @director.movies.find(params[:movie_id])
      
      if @movie.update(movie_params)
        render json: @movie
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
      
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Director or movie not found' }, status: :not_found
    end
    
    
    def search_by_sinopsis
      keyword = params[:keyword]
      @movies = Movie.where("sinopsis LIKE ?", "%#{keyword}%")
      render json: @movies
    end
    
    # Part 3
    
    def delete_lowest_ranked_director
      lowest_ranked_director = Director.find_by_sql("SELECT directors.*, MIN(rankings.score) AS min_score
      FROM directors
      LEFT JOIN rankings ON directors.id = rankings.director_id
      GROUP BY directors.id
      ORDER BY min_score
      LIMIT 1").first
      
      if lowest_ranked_director
        lowest_ranked_director.destroy
        render json: { message: 'Director with lowest ranking score deleted' }
      else
        render json: { error: 'No directors found with rankings' }, status: :not_found
      end
    
    end
    
  end
    