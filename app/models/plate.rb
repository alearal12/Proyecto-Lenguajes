class Plate < ApplicationRecord

    has_many :orders
    has_one_attached :image
    has_rich_text :description
end
