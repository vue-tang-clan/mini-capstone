class ChangePriceToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end
