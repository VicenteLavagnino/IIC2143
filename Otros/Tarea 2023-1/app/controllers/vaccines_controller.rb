class VaccinesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @vaccine = Vaccine.where(person_id: params[:person_id])
        render json: @vaccine
    end

    def create
        @vaccine = Vaccine.new(vaccine_params)
        @vaccine.person_id = params[:person_id]

        if @vaccine.save
            @vaccine_find = Vaccine.where("person_id = ?", params[:person_id])
            render json: @vaccine_find, status: :created
        else
            render json: @vaccine.errors, status: :unprocessable_entity
        end
    end

    def update
        @vaccine = Vaccine.find(params[:id])

        if @vaccine.update(vaccine_params)
            @vaccine_find = Vaccine.where(person_id: params[:person_id])
            render json: @vaccine_find
        else
            render json: @vaccine.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @vaccine = Vaccine.find(params[:id])
        @vaccine.destroy

        @vaccine_find = Vaccine.where(person_id: params[:person_id])
        render json: @vaccine_find
    end

    private
        def vaccine_params
            params.require(:vaccine).permit(:vaccine_type, :vaccine_date)
        end

end
 