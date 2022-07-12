module OrdersHelper
    def statuses
        Order.statuses.keys.map do |status|
            [Order.statuses, status]
        end
    end
end
