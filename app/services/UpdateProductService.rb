class UpdateProductService
    def initialize(product, params)
      @product = product
      @params = params
    end
  
    def call
      if @params[:image] && !file?(@params[:image])
        delete_image if @product.image.attached?
        @params.delete(:image)
      end
  
      @product.update(@params)
    end
  
    private
  
    def file?(param)
      param.is_a?(ActionDispatch::Http::UploadedFile)
    end
  
    def delete_image
      @product.image.purge
    end
  end