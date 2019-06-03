class ProductsController < ApplicationController
    before_action :authenticate_user, only: [  :updated]
    
    #get
    def index
        if params[:per_page]
            products= Product.paginate(page: params[:page], per_page: params[:per_page])
        else
            products= Product.paginate(page: params[:page], per_page: 15)
        end
        render json:products, status: 200
    end
    
    #get
    def show
        @products = Product.where(nil)
        filtering_params().each do |key, value|
          @products = @products.public_send(key, value) if value.present? and key.present?
        end
        if @products != Product.where(nil)
            render json:@products, status: 200
        end         
    end

    def create
        product = Product.new(user_params)
        if product.save
            render json: product,status:201
        else
            render json:product.errors, status: :unprocessable_entity
        end
    end

    def updated
        product = Product.find(params[:id])
        if product.update(user_params)
           render json:product, status:200
        else 
            render json:product.errors, status: :unprocessable_entity
        end
    end

    def destroy 
        product = Product.find(params[:id])
        product.destroy
    end

    private
    def user_params
        params.require(:product).permit(:nombre, :categoria, :descripcion, :medidas, :grosor, :densidad, :tipo_tela, :lamina, :cassata, :valor)
    end

    def filtering_params
        params.permit(:nombre, :categoria, :id, :starts_with)
    end
end
