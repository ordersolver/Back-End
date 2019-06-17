class GoogleLoginController < ApplicationController
    Aud="506919261604-1fkfc1b1kt8dgkgokajl67jq6576c1m0.apps.googleusercontent.com"
    UserTokenController
    def verify
        token = params[:token].to_s
        res=HTTParty.get("https://www.googleapis.com/oauth2/v3/tokeninfo?access_token=#{token}")
        if res.code==200
            if valid_aud?(res)
                sub=JSON.parse(res.to_s)['sub']
                puts sub
                user=User.google_id(sub).first
                puts user
                if user
                    userToken = UserTokenController.new
                    auth=userToken.create({"auth"=>{email=>user.email,password=>user.password}})
                    render json:auth, status:200
                else
                    error={error:"usuario no registrado"}
                    render json:error
                end
            else
                error={error:"invalid token"}
                render json:error, status:400
            end
        else
            render json:res, status:res.code
        end
    end

    def valid_iss?(res)
        iss=JSON.parse(res.to_s)['iss']
        if 
            iss=="https://accounts.google.com" || iss=="accounts.google.com" 
            return true
        else
            return false
        end
    end

    def valid_aud?(res)
        aud=JSON.parse(res.to_s)['aud']
        if aud == Aud
            return true
        else
            return true
        end
    end

end