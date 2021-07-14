class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :nombre
      t.integer :porcentaje_comision
      t.timestamps
    end
  end
end
