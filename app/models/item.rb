class Item < ApplicationRecord
    has_many :possessions, dependent: :destroy
    has_many :users, through: :possessions
end
