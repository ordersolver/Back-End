class NumberOfOrdersQuery
    def initialize(params={inicio:6.months.ago , fin:Time.now}, relation = Order.includes(:products, :user))
        @relation=relation
        @params=params
    end

    def resp
        @relation.where(created_at: @params[:inicio]..@params[:fin])
    end
    #scope :pedidos_entre, ->(inicio,fin) { where created_at: inicio.beginning_of_day..fin.end_of_day }
end
