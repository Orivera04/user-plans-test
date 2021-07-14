class CreatePagoDetalles < ActiveRecord::Migration[6.0]
  def change
    create_table :pago_detalles do |t|
      t.references :pago
      t.references :user
      t.decimal :monto_comision
    end
  end
end
