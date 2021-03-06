class OrdersController < ApplicationController
    before_action :authenticate_user, only: [:index,:create, :show, :updated, :destroy]

    def index
        if params[:per_page]
            orders= OrdersQuery.new.all.paginate(page: params[:page], per_page: params[:per_page])
        else
            orders= OrdersQuery.new.all.paginate(page: params[:page], per_page: 15)
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

    def genpdf
      respond_to do |format|
        format.html
        format.pdf do
          pdf = CotizacionPdf.new(params[:_json])
          send_data pdf.render,
                    filename: "Cotizacion.pdf",
                    type: 'application/pdf',
                    disposition: 'inline'
        end
      end
    end

    def confirmation_email
        @user = User.find(params[:id_user])
        @order = Order.find(params[:id_order])
        OrderMailer.orderconfirmation_email(@user,@order).deliver
    end

    def entregado_email
        @user = User.find(params[:id_user])
        @order = Order.find(params[:id_order])
        OrderMailer.pedidoentregado_email(@user,@order).deliver
    end

    def problem_email
        @user = User.find(params[:id_user])
        @order = Order.find(params[:id_order])
        OrderMailer.orderproblem_email(@user,@order).deliver
    end

    def user_params
        params.require(:order).permit(:fecha, :estado, :direccion_entrega, :valor, :user_id)
    end

    def filtering_params
        params.permit(:estado, :id)
    end

end
