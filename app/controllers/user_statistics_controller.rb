class UserStatisticsController < ApplicationController
    require "SvgGraph"
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

    def mostSold
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
            temp={}
            if aux == initialDate
                orders = NumberOfOrdersQuery.new(params={inicio:aux, fin:aux.end_of_month, id:user_id}).resp
            else
                orders = NumberOfOrdersQuery.new(params={inicio:aux.beginning_of_month, fin:aux.end_of_month, id:user_id}).resp
            end 
            current_month = getMonth(aux.mon)
            for order in orders
                products = order.products
                for product in products
                    if product.id
                        nombre = product.nombre
                        if temp.key?(:"#{nombre}")
                            temp[:"#{nombre}"]=temp[:"#{nombre}"]+1
                        else
                            temp[:"#{nombre}"]=1
                        end
                    end
                end
            end
            aux=aux.next_month
            temp = Hash[ temp.sort_by { |key, val| val }.reverse ]
            ans.push({mes:current_month,ventas:temp.first})
        end
        render json:ans , status: 200
    end

    def getMonth(month)
        months=["","enero","febrero","marzo","abril","mayo","junio","julio","agosto","septiembre","octubre","noviembre","diciembre"]
        months[month]
    end

    def genPdf (data,x_axis,title)
        datos= {data: data, x_axis: x_axis}
        g = SvgGraph.new(datos)
        print g.get_svg
        pdf=StatisticsPdf.new({:title => title,:svg => g.get_svg})
        send_data pdf.render, filename: "blog.pdf", type: "application/pdf"
    end

    def numOfOrdersPdf
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
        x_axis = []
        data=[]
        puts ans
        for i in ans
            x_axis.push(i[:mes])
            data.push(i[:compras])
        end
        puts x_axis
        puts data
        genPdf(data,x_axis,"Cantidad de Ordenes")
    end

    def spentMoneyPdf
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
        x_axis = []
        data=[]
        puts ans
        for i in ans
            x_axis.push(i[:mes])
            data.push(i[:valor])
        end
        puts x_axis
        puts data
        genPdf(data,x_axis,"Dinero gastado")
    end

    def mostSoldPdf
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
            temp={}
            if aux == initialDate
                orders = NumberOfOrdersQuery.new(params={inicio:aux, fin:aux.end_of_month, id:user_id}).resp
            else
                orders = NumberOfOrdersQuery.new(params={inicio:aux.beginning_of_month, fin:aux.end_of_month, id:user_id}).resp
            end 
            current_month = getMonth(aux.mon)
            for order in orders
                products = order.products
                for product in products
                    if product.id
                        nombre = product.nombre
                        if temp.key?(:"#{nombre}")
                            temp[:"#{nombre}"]=temp[:"#{nombre}"]+1
                        else
                            temp[:"#{nombre}"]=1
                        end
                    end
                end
            end
            aux=aux.next_month
            temp = Hash[ temp.sort_by { |key, val| val }.reverse ]
            ans.push({mes:current_month,ventas:temp.first})
        end
        x_axis=[]
        data=[]
        for i in ans
            if i[:ventas]!=nil
                data.push(i[:ventas][1])
            else
                data.push(0)
            end
            x_axis.push(i[:mes])
        end
        puts x_axis
        puts data
        genPdf(data,x_axis,"Producto mas vendido")
    end
end
