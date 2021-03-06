class RolsController < ApplicationController

    #get
    def index
        rols= Rol.all
        render json:rols, status: 200
    end
    
    #get
    def show
        rol = Rol.find(params[:id])
        render json: rol, status: 200
    end

    def create
        rol = Rol.new(user_params)
        if rol.save
            render json: rol,status:201
        else
            render json:rol.errors, status: :unprocessable_entity
        end
    end

    def updated
        rol = Rol.find(params[:id])
        if rol.update(user_params)
           render json:rol, status:200
        else 
            render json:rol.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        rol = Rol.find(params[:id])
        rol.destroy
    end

    def user_params
        params.require(:rol).permit(:rol_name, :descripcion)
    end

end
