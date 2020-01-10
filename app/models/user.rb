class User < ApplicationRecord
    has_many :possessions
    has_many :items, through: :possessions
    validates :name,uniqueness: true

    def become_deceased
        #redirect_to '/users/die'
    end
end
