class OrdersController < ApplicationController
    before_action :authenticate_user, only: [:index, :create, :show, :updated, :destroy]

    def index
        if params[:per_page]
            orders= Order.includes(:products,:user).paginate(page: params[:page], per_page: params[:per_page])
        else
            orders= Order.includes(:products,:user).paginate(page: params[:page], per_page: 15)
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
        order = Order.new(user_params)
        productos= params[:productos]
        productos.each do |i|
            order.products<<Product.find(i)
        end
        if order.save
            render json: order,status:201
        else
            render json:order.errors, status: :unprocessable_entity
        end
    end
    
    def updated
        order = Order.find(params[:id])
        if order.update(user_params)
           render json:order, status:200
        else 
            render json:order.errors, status: :unprocessable_entity
        end
    end

    def destroy
        order = Order.find(params[:id])
        order.product_ids.each do |i|
            order.products.delete(Product.find(i))
        end
        order.destroy
    end

    def user_params
        params.require(:order).permit(:fecha, :estado, :direccion_entrega, :valor, :user_id)
    end

    def filtering_params
        params.permit(:estado, :id)
    end

end
