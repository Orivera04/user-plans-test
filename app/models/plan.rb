class Plan < ApplicationRecord
  validates :nombre, presence: true
  validates :porcentaje_comision, presence: true
end
