class OrdersController < ApplicationController
    before_action :authenticate_user, only: [:index, :create, :updated, :destroy]
    
        def index
            if params[:per_page]
                orders= Order.paginate(page: params[:page], per_page: params[:per_page])
            else
                orders= Order.paginate(page: params[:page], per_page: 15)
            end
            render json:orders, status: 200
        end
        
        
    def show
        @orders = Order.where(nil)
        filtering_params().each do |key, value|
            @orders = @orders.public_send(key, value) if value.present? and key.present?
        end
        if @orders != Order.where(nil)
            render json:@orders, status: 200
        end         
    end
    
    def create
        order = Order.new(params[:fecha], params[:estado], params[:direccion_entrega],params[:valor])
        if order.save
            render json: order,status:201
        else
            render json:order.errors, status: :unprocessable_entity
        end
    end
    
    def updated
        order = Order.find(params[:id])
        if order.update(params[])
           render json:order, status:200
        else 
            render json:order.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        order = Order.find(params[:id])
        order.destroy
    end

    def filtering_params
        params.permit(:estado, :id)
    end


end
