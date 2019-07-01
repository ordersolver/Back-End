class UserStatisticsController < ApplicationController
    def numOfOrders 
        user_id=params[:user_id]
        
        if params[:inicio] && params[:fin]
            inicio = params[:inicio]
            fin = params[:fin]        
            orders=NumberOfOrdersQuery.new(params={inicio:inicio, fin:fin})
        else
            orders=NumberOfOrdersQuery.new()
            inicio = 6.months.ago
            fin = Time.now
        end
        
        initialDate= Date.parse(inicio)
        finalDate= Date.parse(fin)
        
        ans=[]
        aux= initialDate
        while (aux<finalDate)
            if aux == initialDate
                orders = NumberOfOrdersQuery.new(params={inicio:aux, fin:aux.end_of_month, id:user_id}).users.count
            else
                orders = NumberOfOrdersQuery.new(params={inicio:aux.beginning_of_month, fin:aux.end_of_month, id:user_id}).users.count
            end 
            current_month = getMonth(aux.mon)
            puts orders
            aux=aux.next_month
            ans.push({mes:current_month,compras:orders})
        end
        puts ans
        render json:ans , status: 200
    end

    def spentMoney 
        user_id=params[:user_id]
        
        if params[:inicio] && params[:fin]
            inicio = params[:inicio]
            fin = params[:fin]        
            orders=NumberOfOrdersQuery.new(params={inicio:inicio, fin:fin})
        else
            orders=NumberOfOrdersQuery.new()
            inicio = 6.months.ago
            fin = Time.now
        end
        
        initialDate= Date.parse(inicio)
        finalDate= Date.parse(fin)
        
        ans=[]
        aux= initialDate
        while (aux<finalDate)
            if aux == initialDate
                orders = NumberOfOrdersQuery.new(params={inicio:aux, fin:aux.end_of_month, id:user_id}).users.sum(:valor)
            else
                orders = NumberOfOrdersQuery.new(params={inicio:aux.beginning_of_month, fin:aux.end_of_month, id:user_id}).users.sum(:valor)
            end 
            current_month = getMonth(aux.mon)
            puts orders
            aux=aux.next_month
            ans.push({mes:current_month,valor:orders})
        end
        puts ans
        render json:ans , status: 200
    end

    def getMonth(month)
        months=["","enero","febrero","marzo","abril","mayo","junio","julio","agosto","septiembre","octubre","noviembre","diciembre"]
        months[month]
    end
end
