class AddPlansToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telefono, :string
    add_column :users, :parent_id, :integer
    add_reference :users, :plan, index: true
  end
end
