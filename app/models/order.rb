class Order < ApplicationRecord

    enum status: { pending: 0, delivered: 1} 
end
