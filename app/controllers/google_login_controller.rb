class GoogleLoginController < ApplicationController
    def verify
        token = params[:token].to_s
        t=HTTParty.get("https://oauth2.googleapis.com/tokeninfo?id_token=#{token}")
        if t.code==200
            render json:t
        else
            render json:t, status:t.code
        end    
    
    end
end
