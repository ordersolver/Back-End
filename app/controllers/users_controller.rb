class UsersController < ApplicationController

    #get
    def index
        users= User.all
        render json:users, status: 200
    end
    
    #get
    def show
        user = User.find(params[:id]).paginate(:page => params[:page], :per_page => 15)
        render json: user, status: 200
    end


    def create
        user = User.new(user_params)
        if user.save
            render json: user,satus:201
        else
            render json:user.errors, status: :unproessable_entity
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
           render json:user, status:200
        else 
            render json:user.errors, status: :unproessable_entity
        end
    end

    def destroy 
        user = User.find(params[:id])
        user.destroy
    end

    private
    def user_params
        params.require(:user).permit(:id,:tipo_documento,:nombre,:apellidos,:direccion,:telefono)
    end

end
