class Customer < ApplicationRecord
    belongs_to :init
    has_many :orders
end
