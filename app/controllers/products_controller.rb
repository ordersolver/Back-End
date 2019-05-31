class ProductsController < ApplicationController
    before_action :authenticate_user, only: [:create, :updated, :destroy]
    
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
        product = Product.find(params[:id])
        render json: product, status: 200
    end

    def create
        product = Product.new(params[:nombre], params[:categoria], params[:descripcion],params[:medidas],params[:gorsor],params[:densidad],params[:tipo_tela],params[:lamina],params[:cassata],params[:valor])
        if product.save
            render json: product,status:201
        else
            render json:product.errors, status: :unproessable_entity
        end
    end

    def updated
        product = Product.find(params[:id])
        if product.update(params[])
           render json:product, status:200
        else 
            render json:product.errors, status: :unproessable_entity
        end
    end

    def destroy 
        product = Product.find(params[:id])
        product.destroy
    end
    
end
