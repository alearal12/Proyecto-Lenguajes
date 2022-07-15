class OrderSearch
    attr_reader :date_from, :date_to , :client_name, :order_status

    def initialize(params)
        params ||= {}

        @date_from = parsed_date(params[:date_from])
        @date_to = parsed_date(params[:date_to])
        @client_name = params[:client_name]
        @order_status = params[:order_status]
    end

    def date_scope
        Order.where('order_date BETWEEN ? AND ?', @date_from, @date_to)
    end

    def name_scope
        Client.where('name LIKE ?', client_name)
    end

    def status_scope
        Order.where('status = ?', order_status)
    end

private

def parsed_date(date_string)
    Date.parse(date_string)
rescue ArgumentError, TypeError
end

end