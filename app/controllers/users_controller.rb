class UsersController < ApplicationController

    #get
    def index
        users= User.all
        render json:users, satatus: 200
    end
    
    #get
    def show
        user = User.find(params[:id])
        render json: user, status: 200
    end


    def create
        user = User.new(params[:id],params[:tipo_documento], params[:nombre], params[:apellidos],params[:direccion],params[:telefono])
        if user.save
            render json: user,satus:201
        else
            render json:user.errors, status: :unproessable_entity
        end
    end

    def updated
        user = User.find(params[:id])
        if user.update(params[])
           render json:user, status:updated
        else 
            render json:user.errors, status: :unproessable_entity
        end
    end

    def destroy 
        user = User.find(params[:id])
        user.destroy
    end

end
