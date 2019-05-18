class OrdersController < ApplicationController
    
        def index
            orders= Order.all
            render json:orders, satatus: 200
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
    
    def updated
        order = Order.find(params[:id])
        if order.update(params[])
           render json:order, status:updated
        else 
            render json:order.errors, status: :unproessable_entity
        end
    end

    def destroy 
        order = Order.find(params[:id])
        order.destroy
    end



end
