class FixErrorColumnNameInUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :cart_id, :order_id
  end
end
