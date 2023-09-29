class VisitorController < ApplicationController
  def show
    @visitors = Visitor.all
      render json: @visitors
  end
  def create
    @visitor = Visitor.new(visitor_params)
      if @visitor.save
        render json: @visitor
      else
        render json: @visitor.errors, status: :unprocessable_entity
      end
  end

  def update
    @visitor = Visitor.find(params[:id])
      if @visitor.update(visitor_params)
        render json: @visitor
      else
        render json: @visitor.errors, status: :unprocessable_entity
      end
  end

  def filter
    @visitor = Visitor.where("id = ?", params[:id]) 
      render json: @visitor 
  end
    
  def destroy
    @visitor = Visitor.find(params[:id])
      @visitor.destroy
  end



  def visitor_params
    params.require(:visitor).permit(:name)
  end
end
