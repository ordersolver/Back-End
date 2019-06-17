class UpdateUserService
    def initialize(user, params)
      @user = user
      @params = params
    end
  
    def call
      if @params[:avatar] && !file?(@params[:avatar])
        delete_avatar if @user.avatar.attached?
        @params.delete(:avatar)
      end
  
      @user.update(@params)
    end
  
    private
  
    def file?(param)
      param.is_a?(ActionDispatch::Http::UploadedFile)
    end
  
    def delete_avatar
      @user.avatar.purge
    end
  end