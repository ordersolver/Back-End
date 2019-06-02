class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show, :updated, :destroy, :current]
    before_action :set_user, only: [:show]

    #get
    def index
        if params[:per_page]
            users= User.paginate(page: params[:page], per_page: params[:per_page])
        else
            users= User.paginate(page: params[:page], per_page: 15)
        end
        
        render json:users, status: 200
    end
    
    #get
    def show
        user = User.find(params[:id])
        render json: user, status: 200
    end

    def current
        render json: current_user
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user,status:201
        else
            render json:user.errors, status: :unprocessable_entity
        end
    end

    def updated
        user = User.find(params[:id])
        if user.update(user_params)
           render json:user, status:200
        else 
            render json:user.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        user = User.find(params[:id])
        user.destroy
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:id, :tipo_documento, :no_id, :nombre, :apellidos, :email, :direccion, :telefono, :password, :password_confirmation)
    end

end
