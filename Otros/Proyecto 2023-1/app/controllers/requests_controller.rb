# frozen_string_literal: true
class RequestsController < ApplicationController

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show
    @request = Request.find(params[:id])
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)
    @request.product_id = params[:product_id]
    @request.user_id = current_user.id
    
    if @request.save
      redirect_to product_url(@request.product), notice: "200"
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: t('.update_success') }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    if @request
      @request.destroy
      redirect_to requests_url, notice: 'Request was successfully destroyed.'
    else
      redirect_to requests_url, alert: 'Request not found.'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:quantity)
  end
end
