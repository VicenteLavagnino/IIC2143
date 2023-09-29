class ReviewController < ApplicationController
    def show
        @reviews = Review.all
        render json: @reviews
    end
    def create
        @review = Review.new(review_params)
        if @review.save
            render json: @review
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            render json: @review
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def filter
        @review = Review.where("id = ?", params[:id]) 
        render json: @review 
    end
    
    def destroy
        @review = Review.find(params[:id])
        @review.destroy
    end



    def review_params
        params.require(:review).permit(:rate, :content, :product)
    end
end
