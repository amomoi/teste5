class Sensor < ApplicationRecord
  belongs_to :cliente
  belongs_to :tipo_sensor
  has_many :leituras
  has_many :statuses
end
