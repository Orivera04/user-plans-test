class PagoDetalle < ApplicationRecord
  belongs_to :pago
  belongs_to :user
end
