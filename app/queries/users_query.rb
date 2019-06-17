class UsersQuery 
    def initialize(params={}, relation = User.includes(:rols))
        @relation=relation
        @params=params
    end

    def all
        @relation.all
    end
end
