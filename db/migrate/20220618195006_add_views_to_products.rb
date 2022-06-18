class AddViewsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :views, :integer, default: 0
  end
end
