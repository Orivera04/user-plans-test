class Pago < ApplicationRecord
  belongs_to :user
  has_many :pago_detalles, dependent: :destroy, inverse_of: :pago
  after_commit :generar_upline

  def generar_upline
    usuario_actual = User.find_by_id(user.parent_id)
    while usuario_actual.present?
      monto_comision_usuario = monto_usd * (usuario_actual.plan.porcentaje_comision.to_d / 100)
      binding.pry
      pago_detalles.build(pago_id: id, user_id: usuario_actual.id, monto_comision: monto_comision_usuario).save!

      usuario_actual = User.find_by_id(usuario_actual.parent_id)
    end
  end
end
