class RequestController < ApplicationController
  def show
    @requests = Request.all
      render json: @requests
  end
  def create
    @request = Request.new(request_params)
      if @request.save
        render json: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
  end

  def update
    @request = Request.find(params[:id])
      if @request.update(request_params)
        render json: @request
      else
        render json: @request.errors, status: :unprocessable_entity
      end
  end

  def filter
    @request = Request.where("id = ?", params[:id]) 
      render json: @request 
  end
    
  def destroy
    @request = Request.find(params[:id])
      @request.destroy
  end



  def request_params
    params.require(:request).permit(:product, :description, :date, :state)
  end
end

