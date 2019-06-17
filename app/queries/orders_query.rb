class OrdersQuery 
    def initialize(params={}, relation = Order.includes(:products, :user))
        @relation=relation
        @params=params
    end

    def all
        @relation.all
    end
end