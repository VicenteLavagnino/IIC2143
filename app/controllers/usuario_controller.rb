class UsuarioController < ApplicationController
    def show
        @usuarios = Usuario.all
        render json: @usuarios
    end
    def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
            render json: @usuario
        else
            render json: @usuario.errors, status: :unprocessable_entity
        end
    end

    def update
        @usuario = Usuario.find(params[:id])
        if @usuario.update(usuario_params)
            render json: @usuario
        else
            render json: @usuario.errors, status: :unprocessable_entity
        end
    end

    def filter
        @usuarios = Usuario.where("id = ?", params[:id]) 
        render json: @usuarios 
    end

    def destroy
        @usuario = Usuario.find(params[:id])
        @usuario.destroy
    end



    def usuario_params
        params.require(:usuario).permit(:name, :description, :image, :number, :mail, :password)
    end
end
