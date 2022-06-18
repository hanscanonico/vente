class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.decimal :price, precision: 10, scale: 2
      t.string :status

      t.timestamps
    end

    create_table :orders_products, id: false do |t|
      t.belongs_to :order
      t.belongs_to :product
    end
  end
end
