class PersonsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @all_persons = Person.all
        render json: @all_persons
        # Código de ...
    end

    def create
        @person = Person.new(person_params)

        if @person.save
            render json: @person, status: :unprocessable_entity
        else
            render json: @person.errors
        end
        # Código de ...
    end

    def show
        @person = Person.find(params[:id])
        render json: @person
        # Código de ...
    end

    def destroy_all
        Person.destroy_all
        render json: Person.all
    end

    private
        def person_params
            params.require(:person).permit(:name)
            #Could be .permit(:name, age)
        end

end
 