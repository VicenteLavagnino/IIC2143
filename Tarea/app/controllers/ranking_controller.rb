class RankingController < ApplicationController

    # Part 3
      
    def index
      @director = Director.find(params[:director_id])
      @rankings = @director.rankings
      render json: @rankings
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Director not found' }, status: :not_found
    end
    
    
    def create
      @director = Director.find(params[:director_id])
      @ranking = @director.rankings.build(ranking_params)
      
      if @ranking.save
        render json: @ranking, status: :created
      
      else
        render json: @ranking.errors, status: :unprocessable_entity
      end
    
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Director not found' }, status: :not_found
    end
      
    private
    
    def ranking_params
      params.require(:ranking).permit(:page, :min_score, :score, :max_score, :director)
    end
    
    def top
      quantity = params[:quantity].to_i
      @top_rankings = Ranking.all.sort_by { |ranking| calculate_normalized_score(ranking) }.reverse.first(quantity)
      render json: @top_rankings
    end
      
    private
    
    def calculate_normalized_score(ranking)
      min_score = ranking.min_score
      max_score = ranking.max_score
      score = ranking.score
      (score - min_score) / (max_score - min_score)
    end
  
  
    # Revisar
    
    def all_rankings_by_page
      @rankings = Ranking.all
      @rankings_by_page = @rankings.group_by { |ranking| ranking.page }
      render json: @rankings_by_page
    end
    
    end
    