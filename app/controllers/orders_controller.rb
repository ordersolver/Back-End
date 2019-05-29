class OrdersController < ApplicationController
    
        def index
            orders= Order.all.paginate(page: params[:page], per_page: 15)
            render json:orders, status: 200
        end
        
        
        def show
            order = Order.find(params[:id])
            render json: order, status: 200
        end
    
    def create
        order = Order.new(params[:fecha], params[:estado], params[:direccion_entrega],params[:valor])
        if order.save
            render json: order,satus:201
        else
            render json:order.errors, status: :unproessable_entity
        end
    end
    
    def update
        order = Order.find(params[:id])
        if order.update(params[])
           render json:order, status:200
        else 
            render json:order.errors, status: :unproessable_entity
        end
    end

    def destroy 
        order = Order.find(params[:id])
        order.destroy
    end



end
