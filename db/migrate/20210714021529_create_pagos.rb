class CreatePagos < ActiveRecord::Migration[6.0]
  def change
    create_table :pagos do |t|
      t.references :user
      t.decimal :monto_usd
      t.timestamps
    end
  end
end
