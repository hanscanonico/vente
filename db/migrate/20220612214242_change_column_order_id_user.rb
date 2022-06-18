class ChangeColumnOrderIdUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:users, :order_id, true)
  end
end
