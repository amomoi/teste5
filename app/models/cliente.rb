class Cliente < ApplicationRecord
    has_many :sensors
    has_many :usuarios
end
