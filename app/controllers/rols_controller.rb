class RolsController < ApplicationController

    #get
    def index
        rols= Rol.all
        render json:rols, satatus: 200
    end
    
    #get
    def show
        rol = Rol.find(params[:id])
        render json: rol, status: 200
    end

    def create
        rol = Rol.new(params[:sinonimo], params[:descripcion])
        if rol.save
            render json: rol,satus:201
        else
            render json:rol.errors, status: :unproessable_entity
        end
    end

    def updated
        rol = Rol.find(params[:id])
        if rol.update(params[])
           render json:rol, status:updated
        else 
            render json:rol.errors, status: :unproessable_entity
        end
    end

    def destroy 
        rol = Rol.find(params[:id])
        rol.destroy
    end

end